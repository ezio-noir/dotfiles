#!/usr/bin/env bash

while true; do
    wid=$(hyprctl clients -j | jq -r '.[] | select(.title=="fastfetch") | .address' | head -n1)
    if [[ -n "$wid" ]]; then
        echo "$wid"
        break
    fi
    sleep 0.5
done