#!/bin/sh

current_date=$(date +%Y%m%d%H%M%S)
screenshot_path=~/Pictures/screenshot_${current_date}.png
screenshot_edit_path=~/Pictures/screenshot_edit_${current_date}.png
slurp | grim -g - - | tee $screenshot_path | wl-copy
swappy -f $screenshot_path -o $screenshot_edit_path

