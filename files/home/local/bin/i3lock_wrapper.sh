#!/bin/bash

# Wrapping script for i3lock-color based on https://github.com/chrjguill/i3lock-color.
#
# This stops any music, pauses the notification daemon and runs i3lock with a colour
# theme. It also appends any command line arguments to i3lock to dynamically allow
# changing settings, such as disabling forking.

# stop music playing
# playerctl pause
mpc -h $HOME/.config/mpd/socket pause

# Ensure dmenu shading is removed before screenshot
sleep 0.2

# pause dunst
killall -SIGUSR1 dunst

# lock the screen
i3lock \
--ignore-empty-password \
--blur 3 \
--radius=100 \
--indicator \
--clock \
--timefont='System San Francisco Display' \
--timecolor=dba300ff \
--datefont='System San Francisco Display' \
--datecolor=dba300ff \
--datestr='%a, %d %b' \
--datesize=18 \
--insidevercolor=0000005c \
--insidewrongcolor=0000005c \
--insidecolor=0000003c \
--ringvercolor=000000fe \
--ringwrongcolor=fa334a80 \
--ringcolor=000000de \
--line-uses-inside \
--keyhlcolor=f4b601ff \
--bshlcolor=fa334a80 \
--textcolor=000000ff \
$*
# --composite \ # will this allow notifications on top?

# resume dunst
killall -SIGUSR2 dunst
