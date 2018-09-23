#!/bin/bash
cd "$(dirname "$0")"

echo "isrecording" > ~/.xmacro/.cache/macro_${1}_recording.bool
if [ "${1}" = "a" ]; then
	notify-send "Xmacro" "Recording started for F1"
	~/.xmacro/xmacrorec2 -r -k 67 > ~/.xmacro/.cache/macro_${1}.txt
elif [ "${1}" = "b" ]; then
	notify-send "Xmacro" "Recording started for F2"
	~/.xmacro/xmacrorec2 -r -k 68 > ~/.xmacro/.cache/macro_${1}.txt
elif [ "${1}" = "c" ]; then
	notify-send "Xmacro" "Recording started for F3"
	~/.xmacro/xmacrorec2 -r -k 69 > ~/.xmacro/.cache/macro_${1}.txt
elif [ "${1}" = "d" ]; then
	notify-send "Xmacro" "Recording started for F4"
	~/.xmacro/xmacrorec2 -r -k 70 > ~/.xmacro/.cache/macro_${1}.txt
else
	notify-send "Xmacro" "Key not set for recording.. check recordmacro.sh"
fi
