#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="20"

t=~/.xmacro/.cache/t


if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *".js "* ]]; then

	lineUnderCursorResult=$(./functions/get_line_and_cursor_column.sh)

	cursorIndex="0"
	line=""
	for i in $(seq 1 ${#lineUnderCursorResult}); do
		if [ "${lineUnderCursorResult:i-1:1}" = ":" ]; then
			cursorIndex=${lineUnderCursorResult:0:1}
			line=${lineUnderCursorResult:i}
			break
		fi
	done

	echo "./functions/word_at_cursor.sh ${cursorIndex} \"${line}\"" > ~/command.txt
	wordAtCursor=$(./functions/word_at_line.sh "${line}" 1)
	nextWordAtCursor=$(./functions/word_at_line.sh "${line}" 2)

	#notify-send "Xmacro" "'${cursorIndex}', '${line}', '${wordAtCursor}', '${nextWordAtCursor}'"

	singleVal="0"
	if [ "$wordAtCursor" = "for" ] && [ "$nextWordAtCursor" = "for" ]; then
		singleVal="1"
	fi

	multiVal="0"
	if [ "$wordAtCursor" = "for" ] && [ ! "$nextWordAtCursor" = "for" ]; then
		multiVal="1"
		singleVal="0"
	fi

	echo "1: ${wordAtCursor}, ${nextWordAtCursor}" > ~/text.txt

	#notify-send "Xmacro" "'$wordAtCursor' = 'error': ${singleErr}"

	if [ "$singleVal" = "1" ]; then
		rm -rf $t
		clipboardContents=`xsel -ob`

		printf "(let i = 0; i < 10; i++) {\n}"​ | xclip -selection clipboard

		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Up" >> $t
		echo "KeyStrRelease Up" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $strokeDelay" >> $t
		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		printf "${clipboardContents}" | xsel -ib
		rm -rf $t
		echo "1"; exit		
	elif [ "$multiVal" = "1" ]; then
		rm -rf $t
		clipboardContents=`xsel -ob`
		printf ".length; i++) {" | xclip -selection clipboard

		echo "#" > $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Home" >> $t
		echo "KeyStrRelease Home" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		printf "(let i = 0; i < " | xclip -selection clipboard

		echo "#" > $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress bracketright" >> $t
		echo "KeyStrRelease bracketright" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Up" >> $t
		echo "KeyStrRelease Up" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		printf "${clipboardContents}" | xsel -ib
		rm -rf $t
		echo "1"; exit		
	fi

	echo "0"; exit
fi

echo "0"

