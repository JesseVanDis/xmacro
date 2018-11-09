#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

strokeDelay="80"
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

