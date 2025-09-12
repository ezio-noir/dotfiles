#!/usr/bin/env bash

hyprctl dispatch exec "[workspace 1] kitty --title btop --hold"
sleep 0.1
hyprctl dispatch exec "[workspace 1] kitty --title fastfetch --hold"
sleep 0.1
hyprctl dispatch exec "[workspace 1] kitty --title fastfetch --hold"
sleep 0.1
hyprctl dispatch exec "[workspace 1] kitty --title cava --hold"
