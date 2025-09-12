#!/usr/bin/env bash

get_address_by_title () {
    hyprctl clients -j | jq -r --arg TITLE "$1" '.[] | select(.title==$TITLE) | .address' | head -n1
}

while [[ -z $(get_address_by_title "fastfetch") ]]; do
    sleep 0.5
done