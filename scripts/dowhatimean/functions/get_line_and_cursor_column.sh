#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

t=~/.xmacro/.cache/t

if [ -f ~/.xmacro/.cache/line ]; then
	savedLine=$(head -n 1 ~/.xmacro/.cache/line)
	printf "$savedLine"
	exit		
fi

clipboardContents=`xsel -ob`

#export MinKeystrokeDelay=40

strokeDelay=20

echo "KeyStrPress Escape" > $t
echo "KeyStrRelease Escape" >> $t
echo "DelayMs $strokeDelay" >> $t
echo "KeyStrPress Shift_L" >> $t
echo "KeyStrPress End" >> $t
echo "KeyStrRelease End" >> $t
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
lineEnd=`xsel -ob`

echo "DelayMs $strokeDelay" > $t
echo "KeyStrPress Escape" >> $t
echo "KeyStrRelease Escape" >> $t
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

~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
completeLine=`xsel -ob`

if [ "${#lineEnd}" = "${#completeLine}" ]; then
	lineEnd=""
fi

lineStart=${completeLine:0: $((${#completeLine}-${#lineEnd}))}

if [ "${#lineEnd}" = "0" ]; then
	# empty line
	echo "DelayMs $strokeDelay" > $t
	echo "KeyStrPress End" >> $t
	echo "KeyStrRelease End" >> $t
	echo "DelayMs $strokeDelay" >> $t
else
	#return cursor to original pos
	echo "DelayMs $strokeDelay" > $t

	if [ ${#lineEnd} -ge ${#lineStart} ]; then
		for ((i = 0; i < ${#lineStart}; ++i)); do
			echo "KeyStrPress Right" >> $t
			echo "KeyStrRelease Right" >> $t
		done
	else
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		for ((i = 0; i < ${#lineEnd}; ++i)); do
			echo "KeyStrPress Left" >> $t
			echo "KeyStrRelease Left" >> $t
		done
	fi
fi

~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
lineStart=`xsel -ob`

wholeLine="${lineStart}${lineEnd}"
column="${#lineStart}"

printf "${clipboardContents}" | xsel -ib
rm -rf $t

lineWithReplacedTabs=$(echo "$wholeLine" | sed "s/\t/ /g")

#notify-send "Xmacro" "line: $column: $wholeLine"

echo "$column: $lineWithReplacedTabs" > ~/.xmacro/.cache/line
printf "$column: $lineWithReplacedTabs"

############ below even more depricated #############
exit

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

notify-send "Xmacro" "$column: $lineWithReplacedTabs"

echo "$column: $lineWithReplacedTabs" > ~/.xmacro/.cache/line
printf "$column: $lineWithReplacedTabs"

