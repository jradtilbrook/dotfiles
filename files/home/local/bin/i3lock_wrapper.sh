#!/bin/bash

# Wrapping script for i3lock-color based on https://github.com/chrjguill/i3lock-color.
#
# This stops any music, pauses the notification daemon and runs i3lock with a colour
# theme. It also appends any command line arguments to i3lock to dynamically allow
# changing settings, such as disabling forking.

# exit early if i3lock is already running
pgrep -x i3lock >/dev/null && exit 0

# pause dunst
notify-send DUNST_COMMAND_PAUSE

# stop music playing
playerctl pause

# Ensure dmenu shading is removed before screenshot
sleep 0.2

# create a temp file for resizing images
# RESIZED_IMAGE_PATH=$(mktemp)
# IMAGE_PATH=~/.screensaver
# determine the current screen resolution. NB: this probably only works for a single screen
# RESOLUTION=$(xrandr -q | head -1 | sed -n 's:.*current\s\([0-9]\+\)\sx\s\([0-9]\+\).*:\1x\2:p')
LOCK_IMAGE="--blur 8"
# TODO: see if the processing time can be reduced - this conversion takes a few seconds
# convert $IMAGE_PATH -resize $RESOLUTION^ -gravity center -extent $RESOLUTION $RESIZED_IMAGE_PATH
# LOCK_IMAGE="-i $RESIZED_IMAGE_PATH -t"

# lock the screen
i3lock \
--ignore-empty-password \
$LOCK_IMAGE \
--radius=120 \
--ring-width=10 \
--indicator \
--clock \
--time-font='System San Francisco Display' \
--timecolor=52cbb0ff \
--date-font='System San Francisco Display' \
--datecolor=52cbb0ff \
--datestr='%a, %d %b' \
--datesize=18 \
--verifcolor=52cbb0ff \
--wrongcolor=ef5253ff \
--insidevercolor=222e388c \
--insidewrongcolor=222e388c \
--insidecolor=222e388c \
--ringvercolor=52cbb0ff \
--ringwrongcolor=ef5253ff \
--ringcolor=222e38ff \
--linecolor=000000ff \
--keyhlcolor=52cbb0ff \
--bshlcolor=ef5253ff \
$*

notify-send DUNST_COMMAND_RESUME

# cleanup temp files
rm -f $RESIZED_IMAGE_PATH

exit 0
