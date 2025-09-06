#/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$HOME/.zshrc" "$DIR/.zshrc"

cp "$HOME/.zprofile" "$DIR/.zprofile"

dirs_to_cp=(
    "cava"
    "clipse"
    "Code - OSS"
    "colors"
    "gtk-3.0"
    "hypr"
    "kitty"
    "nvim"
    "pulse"
    "swaync"
    "uwsm"
    "waybar"
    "wofi"
    "yay"
)

files_to_cp=(
    "pavucontrol.ini"
)

cp -r "$HOME/.config" "$DIR/.config"

pacman -Qqe > "$DIR/pacman.txt"

pacman -Qqm > "$DIR/aur.txt"
