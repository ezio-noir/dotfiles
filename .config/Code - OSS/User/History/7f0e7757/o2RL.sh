#/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$HOME/.zshrc" "$DIR/.zshrc"
echo "✓ Updated pacman packages list"

cp "$HOME/.zprofile" "$DIR/.zprofile"
echo "✗ Updated AUR packages list"

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

for item in "${dirs_to_cp[@]}"; do
    source_path="$HOME/.config/$item"
    if [[ -d "$source_path" ]]; then
        cp -r "$source_path" "$DIR"
        echo "✓ Copied file: $item/"
    else
        echo "✗ '$item' not found"
    fi
done

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

pacman -Qqe > "$DIR/pacman.txt"
echo "✓ Updated pacman packages list"

pacman -Qqm > "$DIR/aur.txt"
echo "✗ Updated AUR packages list"
