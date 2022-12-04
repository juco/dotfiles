#!/usr/bin/env sh

export SPACE=$((17 + $SID))

osascript -e 'tell application "System Events" to key code 18 using control down'
