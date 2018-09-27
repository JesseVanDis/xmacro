#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]] && [[ "$WindowTitle" = *"debug/include"* ]] && [[ "$WindowTitle" = *"_bdef"* ]]; then

	filename=$(./functions/get_filename.sh)
	filesubstr=$(echo "${filename%.*}" | awk -F '_' '{print $1}')
	fileBdef="${filesubstr}.bdef"

	./functions/navigate_to_file.sh "${fileBdef}"

	echo "1"; exit
fi

echo "0"

