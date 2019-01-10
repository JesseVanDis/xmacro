#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

#rr2 - [/media/jvandis/ssd/projects/rr-tournament/code] - .../client/build/linux/debug/include/soldierbehaviours.hpp - CLion 2017.2.3
if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]]; then

	selectedText=$(./functions/get_selected_text.sh)

	if [[ "$selectedText" = *"mui_"* ]] || [[ "$selectedText" = *"sta_"* ]]; then
		while IFS='' read -r line || [[ -n "$line" ]]; do
			if [[ "$line" = *"name='${selectedText}'"* ]]; then
				#<value type='string' name='a_adv_achiever'>I want them all. No excuses. I just want them!</value>
				result=$(echo "$line" | grep -P '(?<=>).*(?=<)' -o)
				notify-send "Xmacro" "$result"
				break
			fi
		done < ~/projects/rr-tournament/assets/texts/texts_en-dev.locatext
		echo "1"; exit
	fi
	
fi

echo "0"

