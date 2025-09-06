#!/usr/bin/env bash

MAX_BRIGHTNESS=$(brightnessctl m)

# Get brightness
get_backlight() {
	LIGHT=$(printf "%.0f\n" $(brightnessctl g))
	echo "${LIGHT}"
}

get_percent() {
	echo "$(( $(get_backlight) * 100 / MAX_BRIGHTNESS ))"
}

# Get icons
get_icon() {
	local percent="$(get_percent)"
	if [[ ("$percent" -ge "0") && ("$percent" -lt "20") ]]; then
		icon="󰃜"
	elif [[ ("$percent" -ge "20") && ("$percent" -lt "40") ]]; then
		icon="󰃝"
	elif [[ ("$percent" -ge "40") && ("$percent" -lt "60") ]]; then
		icon="󰃞"
	elif [[ ("$percent" -ge "60") && ("$percent" -lt "80") ]]; then
		icon="󰃟"
	elif [[ ("$percent" -ge "80") && ("$percent" -le "100") ]]; then
		icon="󰃠"
	fi
}

# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$icon Brightness: $(get_percent)%"
}

# Increase brightness
inc_backlight() {
	local delta=${1:-10}
	brightnessctl s +"$delta"% && get_icon && notify_user
}

# Decrease brightness
dec_backlight() {
	local delta=${1:-10}
	brightnessctl s "$delta"%- && get_icon && notify_user
}

# Execute accordingly
if [[ "$1" == "get" ]]; then
	get_percent
elif [[ "$1" == "inc" ]]; then
	inc_backlight $2
elif [[ "$1" == "dec" ]]; then
	dec_backlight $2
else
	get_backlight
fi
