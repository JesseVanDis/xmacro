#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

t=~/.xmacro/.cache/t

clipboardContents=`xsel -ob`

#export MinKeystrokeDelay=40

strokeDelay=40


echo "KeyStrPress Escape" > $t
echo "KeyStrRelease Escape" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress x" >> $t
echo "KeyStrRelease x" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress End" >> $t
echo "KeyStrRelease End" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Shift_L" >> $t
echo "KeyStrPress Home" >> $t
echo "KeyStrRelease Home" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Home" >> $t
echo "KeyStrRelease Home" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Shift_L" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress c" >> $t
echo "KeyStrRelease c" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $strokeDelay" >> $t

~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
moddedLine=`xsel -ob`

echo "KeyStrPress Escape" > $t
echo "KeyStrRelease Escape" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress z" >> $t
echo "KeyStrRelease z" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress End" >> $t
echo "KeyStrRelease End" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Shift_L" >> $t
echo "KeyStrPress Home" >> $t
echo "KeyStrRelease Home" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Home" >> $t
echo "KeyStrRelease Home" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Shift_L" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress c" >> $t
echo "KeyStrRelease c" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress Shift_L" >> $t
echo "KeyStrPress z" >> $t
echo "KeyStrRelease z" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Shift_L" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress z" >> $t
echo "KeyStrRelease z" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $strokeDelay" >> $t

~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
line=`xsel -ob`

#notify-send "Xmacro" "${wordUnderCursor}"

printf "${clipboardContents}" | xsel -ib

rm -rf $t

column="${#moddedLine}"

for i in $(seq 1 ${#line})
do
	c1=${line:i-1:1}
	c2=${moddedLine:i-1:1}
	if [ ! "$c1" = "$c2" ]; then
		column="${i}"
		break
	fi
done

#lineWithReplacedTabs=$(echo "$line" | sed "s/\t/     /g")
lineWithReplacedTabs=$(echo "$line" | sed "s/\t/ /g")


echo "$column: $lineWithReplacedTabs"

