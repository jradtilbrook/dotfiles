#!/bin/bash
# This script can be run to prompt for bluetooth devices to connect to

# show this prompt with colour
if [ $1 = "connect" ]; then
    # blue if connecting
    TEXT_COLOUR="#33B5E1"
else
    # otherwise red
    TEXT_COLOUR="#EF5253"
fi

theme="element selected.normal { text-color: $TEXT_COLOUR; }"
select=$(bluetoothctl devices | sed 's/Device \(\w\)/\1/g' | rofi -dmenu -p "$1" -theme-str "$theme" -no-custom | sed 's/\([^ ]\+\).*/\1/g')
[ -z "$select" ] && exit 0

case $1 in
    connect)
        bluetoothctl connect "$select"
    ;;
    disconnect)
        bluetoothctl disconnect "$select"
    ;;
esac
