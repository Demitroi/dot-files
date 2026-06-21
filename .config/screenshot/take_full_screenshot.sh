#!/bin/sh

current_date=$(date +%Y%m%d-%H%M%S)
screenshot_path=~/Pictures/screenshot_${current_date}.png
focused_output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
grim -o "$focused_output" - | tee "$screenshot_path" | wl-copy
swappy -f $screenshot_path
