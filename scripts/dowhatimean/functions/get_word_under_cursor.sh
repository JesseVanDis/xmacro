#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

t=~/.xmacro/.cache/t

clipboardContents=`xsel -ob`

echo "#" > $t
echo "KeyStrPress Escape" >> $t
echo "KeyStrRelease Escape" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress Left" >> $t
echo "KeyStrRelease Left" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress Shift_L" >> $t
echo "KeyStrPress Right" >> $t
echo "KeyStrRelease Right" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrRelease Shift_L" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrPress Control_L" >> $t
echo "KeyStrPress c" >> $t
echo "KeyStrRelease c" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrRelease Control_L" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t
echo "KeyStrPress Escape" >> $t
echo "KeyStrRelease Escape" >> $t
echo "DelayMs $MinKeystrokeDelay" >> $t

~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

wordUnderCursor=`xsel -ob`

#notify-send "Xmacro" "${wordUnderCursor}"

printf "${clipboardContents}" | xsel -ib

rm -rf $t

echo "${wordUnderCursor}"

