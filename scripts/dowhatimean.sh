#!/bin/bash
cd "$(dirname "$0")"

windowTitle=$(xdotool getwindowfocus getwindowname)
echo "$windowTitle" > ~/.xmacro/.cache/windowTitle.txt

#notify-send "Xmacro" "$windowTitle"

didExecute="0"
cd ./dowhatimean
for f in ./*.sh; do
	if [ ! "${f}" = "./header.sh" ]; then
		didExecute=$($f)
		if [ "${didExecute}" = "1" ]; then
			break
		fi
	fi
done
if [ "${didExecute}" = "0" ]; then
	# type the character `..
	clipboardContents=`xsel -ob`
#	notify-send "Xmacro" "$clipboardContents"
	printf "\`" | xsel -ib
	echo "#" > ~/.xmacro/.cache/k
	echo "DelayMs 20" >> ~/.xmacro/.cache/k
	echo "KeyStrPress Control_L" >> ~/.xmacro/.cache/k
	echo "KeyStrPress v" >> ~/.xmacro/.cache/k
	echo "DelayMs 10" >> ~/.xmacro/.cache/k
	echo "KeyStrRelease v" >> ~/.xmacro/.cache/k
	echo "DelayMs 10" >> ~/.xmacro/.cache/k
	echo "KeyStrRelease Control_L" >> ~/.xmacro/.cache/k
	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/k
	rm -rf ~/.xmacro/.cache/k
	printf "${clipboardContents}" | xsel -ib	
fi


