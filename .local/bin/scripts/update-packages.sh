#!/bin/bash

set -e
    
pkg_dir="$HOME/.dotfiles/packages"

mkdir -p "$pkg_dir"

echo "Updating pacman package list..."
pacman -Qqen | sort > "$pkg_dir/pacman.txt"

echo "Updating AUR packages list..."
yay -Qqem | sort > "$pkg_dir/aur.txt"

echo "Done"
