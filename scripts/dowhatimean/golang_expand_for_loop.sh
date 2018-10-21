#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="15"

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
	nextWordAtCursor=$(./functions/word_at_cursor.sh ${cursorIndex} "${line}" 1)

	#notify-send "Xmacro" "'${cursorIndex}', '${line}', '${wordAtCursor}', '${nextWordAtCursor}'"

	if [ "$wordAtCursor" = "for" ] && [ "$nextWordAtCursor" = "for" ]; then
		# for i := 0; i < 100; i++ {
		# 	|
		# }
		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress 0" >> $t
		echo "KeyStrRelease 0" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress comma" >> $t
		echo "KeyStrRelease comma" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress 1" >> $t
		echo "KeyStrRelease 1" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress 0" >> $t
		echo "KeyStrRelease 0" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress 0" >> $t
		echo "KeyStrRelease 0" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress bracketleft" >> $t
		echo "KeyStrRelease bracketleft" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

		echo "1"; exit
	fi

	if [ "$wordAtCursor" = "for" ] && [ ! -z "${nextWordAtCursor}" ]; then
		#for i, v := range henk {
		#  |
		#}
		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress i" >> $t
		echo "KeyStrRelease i" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress comma" >> $t
		echo "KeyStrRelease comma" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress semicolon" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease semicolon" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress equal" >> $t
		echo "KeyStrRelease equal" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress r" >> $t
		echo "KeyStrRelease r" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress a" >> $t
		echo "KeyStrRelease a" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress n" >> $t
		echo "KeyStrPress g" >> $t
		echo "KeyStrRelease n" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress e" >> $t
		echo "KeyStrRelease g" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease e" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress space" >> $t
		echo "KeyStrRelease space" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress bracketleft" >> $t
		echo "KeyStrRelease bracketleft" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

		echo "1"; exit
	fi


	echo "0"; exit
fi

echo "0"

