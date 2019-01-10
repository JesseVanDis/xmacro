#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

lineAndCursor=""
if [ -f ~/.xmacro/.cache/line ]; then
	lineAndCursor=$(head -n 1 ~/.xmacro/.cache/line)
else
	lineAndCursor=$(./get_line_and_cursor_column.sh)
fi

cursorIndex=$(./get_cursor_from_lineandcursor.sh "${lineAndCursor}")
line=$(./get_line_from_lineandcursor.sh "${lineAndCursor}")

wordAtCursor=$(./word_at_cursor.sh ${cursorIndex} "${line}")

echo "${wordAtCursor}"

