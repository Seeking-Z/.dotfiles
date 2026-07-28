#!/bin/bash

set -e

dotfiles="$HOME/.dotfiles"
pkg_dir="$dotfiles/packages"


echo "Installing packages..."


if [ "$EUID" -eq 0 ]; then
    echo "Do not run this script as root"
    exit 1
fi


if [ ! -d "$pkg_dir" ]; then
    echo "Package directory not found: $pkg_dir"
    exit 1
fi


install_yay() {
    if command -v yay >/dev/null 2>&1; then
        echo "yay already installed"
        return
    fi

    echo "Installing yay..."

    sudo pacman -S --needed --noconfirm base-devel git

    tmpdir=$(mktemp -d)

    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"

    cd "$tmpdir/yay"

    makepkg -si --noconfirm

    cd -

    rm -rf "$tmpdir"
}


# Official packages
if [ -f "$pkg_dir/pacman.txt" ]; then
    echo "Installing pacman packages..."

    sudo pacman -S --needed - < "$pkg_dir/pacman.txt"
fi


install_yay


# AUR packages
if [ -f "$pkg_dir/aur.txt" ]; then
    echo "Installing AUR packages..."

    yay -S --needed - < "$pkg_dir/aur.txt"
fi


echo "Packages installed"
