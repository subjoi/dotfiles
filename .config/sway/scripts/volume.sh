#!/usr/bin/env bash

SINK="@DEFAULT_SINK@"

MUTED=$(wpctl status -n | grep -E -i "(output).*(muted)")

VOLUME=$(wpctl get-volume @DEFAULT_SINK@ | grep -E -o '(0\...)' -)
$((VOLUME * 100))

muted(){
if [[ -n "$MUTED" ]]; then
  return 0
fi
}

if [[ $1 == "--inc" ]]; then
    wpctl set-volume $SINK 5%+ && set-mute $SINK 0 
    notify-send --app-name=volume-control --replace-id=69 --category=device \
      -i "/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-high.svg" \
               "Volume Up:" "$VOLUME%"

elif [[ $1 == "--dec" ]]; then
    wpctl set-volume $SINK 5%- && set-mute $SINK 0
    notify-send --app-name=volume-control --replace-id=69 --category=device \
      -i "/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-medium.svg" \
      "Volume Down:" "$VOLUME%"

elif [[ $1 == "--mute" ]]; then
    wpctl set-mute $SINK toggle
      if muted; then
          notify-send --app-name=volume-control --replace-id=69 --category=device \
            -i "/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-muted.svg" \
            "Volume Muted" "Current volume: $VOLUME%"
      else
          notify-send --app-name=volume-control --replace-id=69 --category=device \
            -i "/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-high.svg" \
          "Volume Unmuted" "Current volume: $VOLUME%"
      fi
fi
