#!/bin/bash
# This script is run to exit from i3.
# Prompts the user for confirmation and sets up colours to suite current theme.

# menu options
options="Cancel\nSleep\nLog out\nShutdown\nRestart"
# override the colours
theme="listview { lines: 5; } element selected.normal { text-color: #EF5253; }"
# prompt user using rofi
select=$(echo -e $options | rofi -dmenu -p "exit" -theme-str "$theme")
# do the appropriate action
case $select in
    "Sleep")
        systemctl suspend-then-hibernate
        ;;
    "Log out")
        i3-msg exit
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Restart")
        systemctl reboot
        ;;
esac

exit 0
