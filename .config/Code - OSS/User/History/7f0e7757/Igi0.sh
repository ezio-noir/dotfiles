#/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$HOME/.zshrc" "$DIR/.zshrc"
echo "✓ Updated .zshrc"

cp "$HOME/.zprofile" "$DIR/.zprofile"
echo "✓ Updated .zprofile"

mkdir -p "$DIR/.config"

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
        cp -rf "$source_path" "$DIR/.config/"
        echo "✓ Copied file: $item/"
    else
        echo "✗ '$item'/ not found"
    fi
done

files_to_cp=(
    "pavucontrol.ini"
)
for item in "${files_to_cp[@]}"; do
    source_path="$HOME/.config/$item"
    if [[ -f "$source_path" ]]; then
        cp "$source_path" "$DIR/.config/"
        echo "✓ Copied file: $item/"
    else
        echo "✗ '$item' not found"
    fi
done

pacman -Qqe > "$DIR/pacman.txt"
echo "✓ Updated pacman packages list"

pacman -Qqm > "$DIR/aur.txt"
echo "✓ Updated AUR packages list"
