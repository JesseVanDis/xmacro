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

if [ "$IsTextEditor" = "1" ]; then
	clipboardContents=`xsel -ob`

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

	printf "${clipboardContents}" | xsel -ib
	rm -rf $t
	printf "$text"
else
	printf ""
fi
