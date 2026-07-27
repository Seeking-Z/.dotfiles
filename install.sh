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
        echo "Already linked: $target"
        return
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
)

for config in "${configs[@]}"; do
    link "$dotfiles/.config/$config" "$HOME/.config/$config"
done


# ~/.local/bin/scripts
link "$dotfiles/.local/bin/scripts" "$HOME/.local/bin/scripts"


# SSH
mkdir -p "$HOME/.ssh"

link "$dotfiles/.ssh/config" "$HOME/.ssh/config"

chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/config"


echo "Done."
