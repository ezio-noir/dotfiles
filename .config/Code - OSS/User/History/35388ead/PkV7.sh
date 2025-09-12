#!/usr/bin/env bash

get_address_by_title () {
    hyprctl clients -j | jq -r ".[] | select(.title==$1) | .address" | head -n1
}

while [[ -n get_address_by_title() ]]; do
    sleep 0.5
done