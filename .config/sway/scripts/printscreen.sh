#!/bin/bash

pic_name=$(date +%Y-%m-%d%s)
print_dir="$HOME/pics/screens"

#execute slurp for <x>,<y> cords, save to ~/pics/screens/
grim -t png -g "$(slurp)" "$print_dir"/$(date +%Y-%m-%d%s).png

# "$_" returns last argument == printdir/picname.png
curl -F 'file=@-' < "$_" 0x0.st | wl-copy
notify-send "Screenshot uploaded" "$(wl-paste)\n$pic_name.png"
