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

for item in "${dirs_to_cp[@]}"; do
    source_path="$HOME/.config/$item"
    if [[ -d "$source_path" ]]; then
        cp -r "$source_path" "$DIR"
        echo "✓ Copied file: $item/"
    else
        echo "✗ '$item' not found"
    fi
done

for item in "${dirs_to_cp[@]}"; do
    source_path="$HOME/.config/$item"
    if [[ -d "$source_path" ]]; then
        cp -r "$source_path" "$DIR"
        echo "✓ Copied file: $item/"
    else
        echo "✗ '$item' not found"
    fi
done

pacman -Qqe > "$DIR/pacman.txt"

pacman -Qqm > "$DIR/aur.txt"
