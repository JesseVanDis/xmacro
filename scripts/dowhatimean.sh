#!/bin/bash
cd "$(dirname "$0")"

windowTitle=$(xdotool getwindowfocus getwindowname)
echo "$windowTitle" > ~/.xmacro/scripts/out.txt

#rr2 - [~/projects/rr-tournament/code] - .../client/sources/ui/uiupgradablecontrol.cpp - CLion 2017.2.3

if [[ "$windowTitle" = *"CLion"* ]] && [[ "$windowTitle" = *"rr2"* ]]; then




	echo "It's there!" >> ~/.xmacro/scripts/out.txt
fi

