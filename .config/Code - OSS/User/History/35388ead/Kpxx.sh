#!/usr/bin/env bash

while true; do
    wid=$(hyprctl clients -j | jq -r '.[] | select(.title=="fastfetch")')
    
    sleep 0.5
done