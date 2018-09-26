#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

t=~/.xmacro/.cache/t

#rr2 - [/media/jvandis/ssd/projects/rr-tournament/code] - .../client/build/linux/debug/include/soldierbehaviours.hpp - CLion 2017.2.3
if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]] && [[ "$WindowTitle" = *"debug/include"* ]]; then

	filename=$(./functions/get_filename.sh)
	fileCrc="${filename%.*}.crc"

	clipboardContents=`xsel -ob`
	printf "${fileCrc}" | xclip -selection clipboard

	echo "#" > $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress p" >> $t
	echo "KeyStrRelease p" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs 300" >> $t
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress v" >> $t
	echo "KeyStrRelease v" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs 300" >> $t
	echo "KeyStrPress Return" >> $t
	echo "KeyStrRelease Return" >> $t
	echo "DelayMs $strokeDelay" >> $t

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

	printf "${clipboardContents}" | xclip -selection clipboard
	#printf "${clipboardContents}" | xsel -ib

	echo "1"; exit
fi

echo "0"

