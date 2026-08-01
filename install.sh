#!/bin/bash

set -e

dotfiles="$HOME/.dotfiles"


backup() {
    local target="$1"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv "$target" "$target.bak"
        echo "Backup: $target -> $target.bak"
    fi
}


link() {
    local source="$1"
    local target="$2"

    if [ ! -e "$source" ]; then
        echo "Source not found: $source"
        return 1
    fi

    if [ -L "$target" ]; then
        if [ "$(readlink "$target")" = "$source" ]; then
            echo "Already linked: $target"
            return
        else
            echo "Wrong link found: $target"
            rm "$target"
        fi
    fi

    backup "$target"

    mkdir -p "$(dirname "$target")"

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"
}


if [ "$EUID" -eq 0 ]; then
    echo "Do not run this script as root"
    exit 1
fi


if [ ! -d "$dotfiles" ]; then
    echo "Dotfiles directory not found: $dotfiles"
    exit 1
fi


# Home files
home_files=(
    ".bashrc"
    ".bash_profile"
    ".gitconfig"
    ".tmux.conf"
)

for file in "${home_files[@]}"; do
    link "$dotfiles/$file" "$HOME/$file"
done


# XDG config directories
configs=(
    "fcitx5"
    "fontconfig"
    "hypr"
    "kitty"
    "nvim"
    "swaync"
    "waybar"
    "rofi"
)

for config in "${configs[@]}"; do
    link "$dotfiles/.config/$config" "$HOME/.config/$config"
done

# systemd user units
for unit in "$dotfiles/.config/systemd/user"/*; do
    [ -f "$unit" ] || continue

    link "$unit" "$HOME/.config/systemd/user/$(basename "$unit")"
done

echo "Daemon reload"
systemctl --user daemon-reload
systemctl --user enable ssh-agent.service

# ~/.local/bin/scripts
link "$dotfiles/.local/bin/scripts" "$HOME/.local/bin/scripts"


# SSH
mkdir -p "$HOME/.ssh"

link "$dotfiles/.ssh/config" "$HOME/.ssh/config"

chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/config"


# Packages
# package_script="$dotfiles/.local/bin/scripts/install-packages.sh"
# 
# if [ -f "$package_script" ]; then
#     echo "Start to install packages..."
# 
#     "$package_script"
# fi


# pacman hooks
pacman_hook_dir="$dotfiles/system/pacman.d/hooks"
pacman_hook_dst="/etc/pacman.d/hooks"

if [ -d "$pacman_hook_dir" ]; then
    echo "Installing pacman hooks..."

    sudo mkdir -p "$pacman_hook_dst"

    for hook in "$pacman_hook_dir"/*.hook; do
        [ -f "$hook" ] || continue

        hook_name="$(basename "$hook")"

        echo "Installing: $hook_name"

        sed \
            -e "s|__USER__|$USER|g" \
            -e "s|__HOME__|$HOME|g" \
            "$hook" | sudo tee "$pacman_hook_dst/$hook_name" > /dev/null
    done
fi


echo "Done."
