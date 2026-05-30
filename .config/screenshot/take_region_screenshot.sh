#!/bin/sh

current_date=$(date +%Y%m%d-%H%M%S)
screenshot_path=~/Pictures/screenshot_${current_date}.png
slurp | grim -g - - | tee $screenshot_path | wl-copy
swappy -f $screenshot_path

