#!/bin/bash
# This script can be run to prompt for clipboard entries and input the selection to the current focus

# show this prompt with a yellow hint
theme="element selected.normal { text-color: #E4B51C; }"
select=$(greenclip print | rg -v 'image/(png|jpeg|bmp)\s' | rofi -dmenu -p "clipboard" -theme-str "$theme")
# put the selection back to the top
greenclip print "$select"
# now print it to the focus
xdotool type --delay 1 --clearmodifiers "$select"
