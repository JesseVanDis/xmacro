#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

#rr2 - [/media/jvandis/ssd/projects/rr-tournament/code] - .../client/build/linux/debug/include/soldierbehaviours.hpp - CLion 2017.2.3
if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]]; then

	wordAtCursor=$(./functions/get_word_under_cursor.sh)

	if [[ "$wordAtCursor" = *"LOCA(\""* ]]; then
		./functions/navigate_to_file_absolute.sh "~/projects/rr-tournament/assets/texts/texts_en-dev.locatext"

		strokeDelay="80"
		t=~/.xmacro/.cache/nav_to_loca

		locakey=$(./functions/get_word_in_quotes.sh "${wordAtCursor}")

		clipboardContents=`xsel -ob`
		printf "${locakey}" | xclip -selection clipboard

		echo "#" > $t
		echo "DelayMs 500" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress f" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease f" >> $t
		echo "DelayMs 200" >> $t
		echo "KeyStrPress apostrophe" >> $t
		echo "KeyStrRelease apostrophe" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress apostrophe" >> $t
		echo "KeyStrRelease apostrophe" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Return" >> $t
		echo "KeyStrRelease Return" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Escape" >> $t
		echo "KeyStrRelease Escape" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Escape" >> $t
		echo "KeyStrRelease Escape" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

		printf "${clipboardContents}" | xclip -selection clipboard
		rm -rf $t

		echo "1"; exit
	fi
fi

echo "0"

