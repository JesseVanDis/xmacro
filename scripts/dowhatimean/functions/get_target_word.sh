#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

while IFS='' read -r line || [[ -n "$line" ]]; do
	targetWord=$line
done < "${HOME}/.xmacro/.cache/target"

if [ "$targetWord" = "selected_text" ]; then
	./get_selected_text.sh
elif [ "$targetWord" = "word_under_cursor" ]; then
	./get_word_under_cursor.sh
else
	notify-send "Xmacro" "failed to select target word. target: ${targetWord}"
fi

