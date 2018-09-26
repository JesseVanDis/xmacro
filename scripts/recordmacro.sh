#!/bin/bash
cd "$(dirname "$0")"

#67 = f1
#88 = num 2

echo "isrecording" > ~/.xmacro/.cache/macro_${1}_recording.bool
if [ "${1}" = "a" ]; then
	notify-send "Xmacro" "Recording started for Num1"
	~/.xmacro/xmacrorec2 -r -k 87 > ~/.xmacro/.cache/macro_${1}.txt
elif [ "${1}" = "b" ]; then
	notify-send "Xmacro" "Recording started for Num2"
	~/.xmacro/xmacrorec2 -r -k 88 > ~/.xmacro/.cache/macro_${1}.txt
elif [ "${1}" = "c" ]; then
	notify-send "Xmacro" "Recording started for Num3"
	~/.xmacro/xmacrorec2 -r -k 89 > ~/.xmacro/.cache/macro_${1}.txt
elif [ "${1}" = "d" ]; then
	notify-send "Xmacro" "Recording started for Num4"
	~/.xmacro/xmacrorec2 -r -k 90 > ~/.xmacro/.cache/macro_${1}.txt
else
	notify-send "Xmacro" "Key not set for recording.. check recordmacro.sh"
fi
