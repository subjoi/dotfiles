#!/bin/bash

killall -q waybar
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done
waybar -c ~/.config/waybar/2bars/2bars.jsonc \
       -s ~/.config/waybar/2bars/2barsstyle.css
notify-send -a waybar-launch "Launched waybar"

