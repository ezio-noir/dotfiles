#!/usr/bin/env bash

get_address_by_title () {
    hyprctl clients -j | jq -r --arg TITLE "$1" '.[] | select(.title==$TITLE) | .address' | head -n1
}

hyprctl dispatch exec "[workspace 1] kitty --title=btop --hold btop"
sleep 0.5
hyprctl dispatch exec "[workspace 1] kitty --title=fastfetch --hold"
sleep 0.5
hyprctl dispatch hy3:makegroup v
sleep 0.5
hyprctl dispatch exec "[workspace 1] kitty --title=cava --hold cava"
