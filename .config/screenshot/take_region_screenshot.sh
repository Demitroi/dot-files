#!/bin/sh

screenshot_path=~/Pictures/screenshot_$(date +%Y%m%d%H%M%S).png
slurp | grim -g - - | tee $screenshot_path | wl-copy
cat $screenshot_path | swappy -f -

