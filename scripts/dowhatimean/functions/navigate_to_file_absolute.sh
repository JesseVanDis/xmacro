#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

DoFallback="1"
if [ "$IsCLion" = "1" ]; then
	if [ -f $CLionExecutable ]; then
		DoFallback="0"
		if [[ "$1" = "~/"* ]]; then
			fullPath="${HOME}${1:1}"
		else
			fullPath=$1
		fi
		temp=$($CLionExecutable "${fullPath}")
	else
		notify-send "Xmacro" "could not find CLion executable at '$CLionExecutable'. using fallback"
	fi
fi

#notify-send "Xmacro" "$DoFallback"
if [ "${DoFallback}" = "1" ]; then
	strokeDelay="120"
	t=~/.xmacro/.cache/nav_to_file_abs

	clipboardContents=`xsel -ob`
	printf "${1}" | xclip -selection clipboard

	echo "#" > $t
	echo "KeyStrPress Alt_L" >> $t
	echo "KeyStrPress f" >> $t
	echo "KeyStrRelease Alt_L" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrRelease f" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrPress o" >> $t
	echo "KeyStrRelease o" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress v" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrRelease v" >> $t
	echo "DelayMs 500" >> $t
	echo "KeyStrPress Return" >> $t
	echo "KeyStrRelease Return" >> $t
	echo "DelayMs $strokeDelay" >> $t

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

	printf "${clipboardContents}" | xclip -selection clipboard
	#printf "${clipboardContents}" | xsel -ib
	rm -rf $t
fi


