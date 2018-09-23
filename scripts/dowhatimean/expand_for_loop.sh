#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"


t=~/.xmacro/.cache/t


if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *".go "* ]]; then

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
	wordAtCursor=$(./functions/word_at_cursor.sh ${cursorIndex} "${line}")
	nextWordAtCursor=$(./functions/word_at_cursor.sh ${cursorIndex} "${line} 1")

	notify-send "Xmacro" "'${cursorIndex}', '${line}', '${wordAtCursor}', '${nextWordAtCursor}'"
exit

	wordUnderCursor=$(./functions/get_word_under_cursor.sh)
	notify-send "Xmacro" "${wordUnderCursor}"

	if [ "$wordUnderCursor" = "for" ]; then

		lineUnderCursor=$(./functions/get_line_under_cursor.sh)

		notify-send "Xmacro" "$lineUnderCursor"

		exit

		# for i := 0; i < 100; i++ {
		# 	|
		# }
		echo "#" > $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress 0" >> $t
		echo "KeyStrRelease 0" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress comma" >> $t
		echo "KeyStrRelease comma" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress 1" >> $t
		echo "KeyStrRelease 1" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress 0" >> $t
		echo "KeyStrRelease 0" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress 0" >> $t
		echo "KeyStrRelease 0" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress bracketleft" >> $t
		echo "KeyStrRelease bracketleft" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $MinKeystrokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

		echo "1"; exit
	fi


	echo "0"; exit
fi

echo "0"

