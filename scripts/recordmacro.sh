#!/bin/bash
cd "$(dirname "$0")"

echo "isrecording" > ~/.xmacro/scripts/macro_a_recording.bool
notify-send "Xmacro" "Recording started"
~/.xmacro/xmacrorec2 -r -k 67 > ~/.xmacro/scripts/macro_a.txt

