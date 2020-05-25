#!/bin/bash
# This script can be run to prompt for bluetooth devices to connect to

# show this prompt with a blue hint
theme="element selected.normal { text-color: #33B5E1; }"
select=$(bluetoothctl devices | sed 's/Device \(\w\)/\1/g' | rofi -dmenu -p "device" -theme-str "$theme" -no-custom | sed 's/\([^ ]\+\).*/\1/g')
[ -z "$select" ] && exit 0

# connect to the provided device
bluetoothctl connect "$select"
