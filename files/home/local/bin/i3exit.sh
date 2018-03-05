#!/bin/bash
# This script is run to exit from i3.
# Prompts the user for confirmation and sets up colours to suite current theme.

# menu options
options="Cancel\nLock\nSleep\nLog out\nShutdown\nRestart"
# colours
colour="#a0000000,#a3a4a1,#a0000000,#da000000,#80fa334a"
# prompt user using rofi
select=$(echo -e $options | rofi -dmenu -p "exit" -color-normal $colour)
# do the appropriate action
case $select in
    "Lock") # Lock
        ~/.local/bin/i3lock_wrapper.sh
        ;;
    "Sleep") # Sleep
        systemctl suspend
        ;;
    "Log out") # Log out
        i3-msg exit
        ;;
    "Shutdown") # Shutdown
        systemctl poweroff
        ;;
    "Restart") # Restart
        systemctl reboot
        ;;
esac

exit 0
