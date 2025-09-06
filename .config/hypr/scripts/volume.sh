#!/usr/bin/env bash

get_volume() {
	local volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2)
	volume=$(printf "%.0f\n" $(echo "$volume * 100" | bc))
	echo "$volume"
}

get_icon() {
	local percent=$(get_volume)
	local status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f3)
	if [[ -n "$status" && "$status" == "[MUTED]" ]]; then
		echo "󰝟"
	elif [[ ("$percent" -ge "0") && ("$percent" -lt "33") ]]; then
		echo ""
	elif [[ ("$percent" -ge "33") && ("percent" -lt "66") ]]; then
		echo ""
	else
		echo ""
	fi
}

notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$(get_icon) Volume: $(get_volume)%"
}

notify_user_muted() {
	local status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f3)
	echo "$status"
	local msg
	if [[ -n "$status" && "$status" == "[MUTED]" ]]; then
		msg="󰝟 Muted"
	else
		msg="$(get_icon) Unmuted: $(get_volume)%"
	fi
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$msg"
}

notify_user_source_muted() {
	local status=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | cut -d' ' -f3)
	local msg=" Unmuted"
	if [[ -n "$status" && "$status" == "[MUTED]" ]]; then
		msg=" Muted"
	fi
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$msg"
}

inc_volume() {
	local delta=${1:-10}
	wpctl set-volume @DEFAULT_AUDIO_SINK@ "$delta"%+ && notify_user
}

dec_volume() {
	local delta=${1:-10}
	wpctl set-volume @DEFAULT_AUDIO_SINK@ "$delta"%- && notify_user
}

toggle_mute() {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify_user_muted
}

toggle_mute_source() {
	wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify_user_source_muted
}

if [[ "$1" == "get" ]]; then
	get_volume
elif [[ "$1" == "inc" ]]; then
	inc_volume $2
elif [[ "$1" == "dec" ]]; then
	dec_volume $2
elif [[ "$1" == "mute" ]]; then
	toggle_mute
elif [[ "$1" == "mute-source" ]]; then
	toggle_mute_source
fi
