#!/usr/bin/env bash

get_address_by_title () {
    hyprctl clients -j | jq -r --arg TITLE "$1" '.[] | select(.title==$TITLE) | .address' | head -n1
}

hyprctl dispatch exec "[workspace 1] kitty --title=btop --hold btop"
while [[ -z $(get_address_by_title "btop") ]]; do
    sleep 0.5
done

hyprctl dispatch exec '[workspace 1] kitty --title=fastfetch --hold sh -c "sleep 0.5; fastfetch; exec sleep infinity"'
while [[ -z $(get_address_by_title "fastfetch") ]]; do
    sleep 0.5
done

hyprctl dispatch hy3:makegroup v
hyprctl dispatch exec "[workspace 1] kitty --title=cava --hold cava"
