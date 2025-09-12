#!/usr/bin/env bash

hyprctl dispatch exec "[workspace 1] kitty --title btop --hold"
sleep 0.5
hyprctl dispatch exec "[workspace 1] kitty --title fastfetch --hold"
sleep 0.5
hyprctl dispatch hy3:makegroup, v
sleep 0.5
hyprctl dispatch exec "[workspace 1] kitty --title cava --hold"
