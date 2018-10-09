#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="15"

t=~/.xmacro/.cache/t


if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *".hpp "* ]]; then

	lineUnderCursorResult=$(./functions/get_line_and_cursor_column.sh)

	if [[ "$lineUnderCursorResult" = *"("* ]]; then

		line=$(./functions/get_line_from_lineandcursor.sh "${lineUnderCursorResult}")

		notify-send "Xmacro" "$line"

	fi

	echo "0"; exit
fi

echo "0"

