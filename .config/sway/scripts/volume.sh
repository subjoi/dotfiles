#!/usr/bin/env bash

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

muted(){
if [[ "$MUTED" == "true" ]]; then
  return 0
fi
}

if [[ $1 == "--inc" ]]; then
    pamixer --increase 5 --unmute && \
    notify-send --app-name=volume-control --replace-id=69 --category=device \
      -i "/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-high.svg" \
               "Volume Up:" "$VOLUME%"

elif [[ $1 == "--dec" ]]; then
    pamixer --decrease 5 --unmute && \
    notify-send --app-name=volume-control --replace-id=69 --category=device \
      -i "/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-medium.svg" \
      "Volume Down:" "$VOLUME%"

elif [[ $1 == "--mute" ]]; then
    pamixer --toggle-mute && \
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
