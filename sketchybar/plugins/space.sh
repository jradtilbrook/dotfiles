#!/bin/sh

source "$CONFIG_DIR/colors.sh"

# when triggered from aerospace workspace change, it sends the FOCUSED_WORKSPACE var
# otherwise, if triggered manually or from a sketchybar item it wont
if [ -n "$FOCUSED_WORKSPACE" ]; then
    # the first argument is the space id from aerospace
    # if that is the current focused space, then change the background colour
    if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set $NAME background.color=$ACCENT_COLOR \
                                label.color=$BAR_COLOR \
                                icon.color=$BAR_COLOR
    else
        sketchybar --set $NAME background.color=$ITEM_BG_COLOR \
                                label.color=$ACCENT_COLOR \
                                icon.color=$ACCENT_COLOR
    fi
fi
