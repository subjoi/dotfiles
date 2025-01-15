#!/bin/bash

NOTIFY_IMAGE_UP="/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-high.svg"
NOTIFY_IMAGE_DOWN="/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-medium.svg"
NOTIFY_IMAGE_MUTED="/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-muted.svg"
NOTIFY_PARAMS="--app-name=volume-control --replace-id=69 --category=device"

SINK="@DEFAULT_SINK@"

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o '[0-9]?[0-9]?[0-9]%' | head -n 1)


raise_volume(){
  wpctl set-volume $SINK 5%+ && wpctl set-mute $SINK 0
  notify-send $NOTIFY_PARAMS -i $NOTIFY_IMAGE_UP "Current volume: $VOLUME"

}

lower_volume(){
  wpctl set-volume $SINK 5%- && wpctl set-mute $SINK 0
  notify-send $NOTIFY_PARAMS -i $NOTIFY_IMAGE_DOWN "Current volume: $VOLUME"
}
toggle_mute(){
  MUTED=$(wpctl status -n | grep -E -i "(output).*(muted)")

  if [[ -z $MUTED ]] ; then
    wpctl set-mute $SINK 1
    notify-send $NOTIFY_PARAMS -i $NOTIFY_IMAGE_MUTED "Volume Muted" "Current volume: $VOLUME"
    return 1
  else
    wpctl set-mute $SINK 0
    notify-send $NOTIFY_PARAMS -i $NOTIFY_IMAGE_UP "Volume Unmuted" "Current volume: $VOLUME"
fi
}


case "$1" in
  -i | --inc )
    raise_volume
    ;;
  -d | --dec )
    lower_volume
    ;;
  -m | --mute )
    toggle_mute
    ;;
  *)
    echo "Usage: $0 --inc, -i | --dec, -d | --mute, -m"
    ;;
esac
