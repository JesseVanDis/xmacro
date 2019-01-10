#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

#rr2 - [/media/jvandis/ssd/projects/rr-tournament/code] - .../client/build/linux/debug/include/soldierbehaviours.hpp - CLion 2017.2.3
if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]]; then

	wordAtCursor=$(./functions/get_selected_text.sh)
	
	if [ "$wordAtCursor" = "LOCA" ]; then
		./functions/navigate_to_file_absolute.sh "~/projects/rr-tournament/assets/texts/texts_en-dev.locatext"
		echo "1"; exit
	fi
fi
echo "0"

