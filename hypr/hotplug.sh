#!/bin/sh

LAPTOP_OUTPUT="eDP-1"
LID_STATE_FILE="/proc/acpi/button/lid/LID/state"

if [ ! -e "$LID_STATE_FILE" ]; then
    LID_STATE_FILE="/proc/acpi/button/lid/LID0/state"
fi

read -r LS < "$LID_STATE_FILE"

case "$LS" in
*open)   hyprctl keyword monitor "${LAPTOP_OUTPUT}, enable" ;;
*closed) hyprctl keyword monitor "${LAPTOP_OUTPUT}, disable" ;;
*)       echo "Could not get lid state" >&2 ; exit 1 ;;
esac
