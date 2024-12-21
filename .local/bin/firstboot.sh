#!/usr/bin/env bash

#start with loading pacman.log
#datelogformat="2022-04-64"
dateLog=$(head -n 1 /var/log/pacman.log | sed -E 's/^\[([0-9]{4}-[0-9]{2}-[0-9]{2})T.*\].*/\1/')
formattedDate=$(date -d $dateLog "+%B %d %Y")
echo "First boot on $formattedDate"

