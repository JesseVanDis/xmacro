#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]] && [[ "$WindowTitle" = *"debug/dataschema"* ]] && [[ "$WindowTitle" = *"_ds"* ]]; then

	filename=$(./functions/get_filename.sh)
	filesubstr=$(echo "${filename%.*}" | awk -F '_' '{print $1}')
	fileDs="${filesubstr}.ds"

	./functions/navigate_to_file.sh "${fileDs}"

	echo "1"; exit
fi

echo "0"

