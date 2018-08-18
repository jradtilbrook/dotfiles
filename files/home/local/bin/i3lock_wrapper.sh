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
# sleep 0.2

# pause dunst
killall -SIGUSR1 dunst

# create a temp file for resizing images
RESIZED_IMAGE_PATH=$(mktemp)
IMAGE_PATH=~/.wallpaper
# determine the current screen resolution. NB: this probably only works for a single screen
RESOLUTION=$(xrandr -q | head -1 | sed -n 's:.*current\s\([0-9]\+\)\sx\s\([0-9]\+\).*:\1x\2:p')
# LOCK_IMAGE="--blur 6"
# TODO: see if the processing time can be reduced - this conversion takes a few seconds
convert $IMAGE_PATH -resize $RESOLUTION^ -gravity center -extent $RESOLUTION $RESIZED_IMAGE_PATH
LOCK_IMAGE="-i $RESIZED_IMAGE_PATH -t"

# lock the screen
i3lock \
--ignore-empty-password \
$LOCK_IMAGE \
--radius=100 \
--indicator \
--clock \
--time-font='System San Francisco Display' \
--timecolor=dba300ff \
--date-font='System San Francisco Display' \
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
$*

# resume dunst
killall -SIGUSR2 dunst

# cleanup temp files
rm -f $RESIZED_IMAGE_PATH

exit 0
