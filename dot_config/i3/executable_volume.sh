#!/bin/bash
# Volume control with dunst notification showing exact percentage
# Usage: volume.sh <up|down|mute> [step]

action="$1"
step="${2:-5}"

case "$action" in
    up)   pactl set-sink-volume @DEFAULT_SINK@ "+${step}%" ;;
    down) pactl set-sink-volume @DEFAULT_SINK@ "-${step}%" ;;
    mute) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac

# Get current state
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')

if [ "$muted" = "yes" ]; then
    dunstify -r 9999 -u low -t 1500 -h string:x-dunst-stack-tag:volume "Volume: MUTED"
else
    pct=${vol%\%}
    filled=$((pct / 5))
    empty=$((20 - filled))
    bar=$(printf '%0.s█' $(seq 1 $filled 2>/dev/null))$(printf '%0.s░' $(seq 1 $empty 2>/dev/null))
    dunstify -r 9999 -u low -t 1500 -h string:x-dunst-stack-tag:volume "Volume: $vol" "$bar"
fi
