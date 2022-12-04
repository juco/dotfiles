#!/usr/bin/env sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

sketchybar --set $NAME background.color=0xff535E6D icon.color=0xffffffff 
if [ "$SELECTED" = "true" ]; then
  sketchybar --set $NAME background.color=0xffD2FFEA icon.color=0xff252C37
fi


# sketchybar --set $NAME background.drawing=$SELECTED
