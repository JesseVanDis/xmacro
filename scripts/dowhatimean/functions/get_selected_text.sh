#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

t=~/.xmacro/.cache/t2

if [ -f ~/.xmacro/.cache/selectedtext ]; then
	savedtext=$(head -n 1 ~/.xmacro/.cache/selectedtext)
	printf "$savedtext"
	exit
fi

strokeDelay=20
pasteDelay=40

if [ "$IsTextEditor" = "1" ]; then
	clipboardContents=`xsel -ob`

	printf ".........." | xclip -selection clipboard

	# when you do ctrl+c in clion, it will select the whole line.. we dont want to that so hack hack hack
	if [ "$IsCLion" = "1" ]; then

		printf " " | xclip -selection clipboard

		echo "DelayMs $strokeDelay" > $t

		# avoiding autocomplete
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease v" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $pasteDelay" >> $t

		# find current curson location
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress z" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease z" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress c" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease c" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress z" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "KeyStrRelease z" >> $t
		echo "DelayMs $strokeDelay" >> $t

#		notify-send "Xmacro" "???"

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		text=`xsel -ob`
		echo "${text}" > ~/.xmacro/.cache/selectedtext

	else
		echo "DelayMs $strokeDelay" > $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress c" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease c" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs 100" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		#~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t
		text=`xsel -ob`
		echo "${text}" > ~/.xmacro/.cache/selectedtext

	fi

	printf "${clipboardContents}" | xsel -ib
	rm -rf $t
	printf "$text"
else
	printf ""
fi
