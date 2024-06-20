#!/bin/bash
# Show icons for apps in each space

if [ "$SENDER" = "space_windows_change" -o "$SENDER" = "routine" ]; then
  for sid in $(/opt/homebrew/bin/aerospace list-workspaces --all); do
      icon_strip=" "
      windows=$(/opt/homebrew/bin/aerospace list-windows --workspace $sid --format '%{app-name}')
      if [ -n "${windows}" ]; then
        while read -r app
        do
            icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
        done <<< "$windows"
    else
        icon_strip=" -"
    fi
    sketchybar --set space.$sid label="$icon_strip"
  done
fi
