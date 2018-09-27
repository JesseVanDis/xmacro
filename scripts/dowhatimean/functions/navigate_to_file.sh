#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh


strokeDelay="40"
t=~/.xmacro/.cache/nav_to_file

notify-send "Xmacro" "'$1'"

clipboardContents=`xsel -ob`
printf "${1}" | xclip -selection clipboard

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
rm -rf $t

