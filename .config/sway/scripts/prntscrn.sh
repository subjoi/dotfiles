#!/bin/bash

saved_dir="$HOME/pics/screens/$(date +%y-%m-%d%s).png"

grim -t png -g "$(slurp)" $saved_dir
swappy -f $saved_dir -o $saved_dir | wl-copy

if [[ $? -eq 0 ]]; then
  curl -F "file=@${saved_dir}" -Fsecret= -Fexpires=1  https://0x0.st | wl-copy
  notify-send "Screenshot uploaded" "$(wl-paste)\n${saved_dir##*/}"
fi

if [[ $? -ne 0 ]]; then
  notify-send "Error" "Screenshot upload failed!"
  exit 1
fi
