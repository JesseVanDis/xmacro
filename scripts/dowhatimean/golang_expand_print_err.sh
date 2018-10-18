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
	wordAtCursor=$(./functions/word_at_line.sh "${line}" 1)
	nextWordAtCursor=$(./functions/word_at_line.sh "${line}" 2)

	#notify-send "Xmacro" "'${cursorIndex}', '${line}', '${wordAtCursor}', '${nextWordAtCursor}'"

	singleErr="0"
	if [ "$wordAtCursor" = "err" ] && [ "$nextWordAtCursor" = "err" ]; then
		singleErr="1"
	fi
	if [ "$wordAtCursor" = "error" ] && [ "$nextWordAtCursor" = "error" ]; then
		singleErr="1"
	fi

	#notify-send "Xmacro" "'$wordAtCursor' = 'error': ${singleErr}"

	if [ "$singleErr" = "1" ]; then
		uniqueId=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

		clipboardContents=`xsel -ob`
		printf "fmt.Println(\"error: id $uniqueId\")" | xclip -selection clipboard
		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Left" >> $t
		echo "KeyStrRelease Left" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
	
		rm -rf $t

		echo "1"; exit
	fi

	echo "0"; exit
fi

echo "0"

