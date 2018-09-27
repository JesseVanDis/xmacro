#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="40"

#rr2 - [/media/jvandis/ssd/projects/rr-tournament/code] - .../client/build/linux/debug/include/soldierbehaviours.hpp - CLion 2017.2.3
if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]] && [[ "$WindowTitle" = *"debug/include"* ]] && [[ ! "$WindowTitle" = *"_bdef"* ]]; then

	filename=$(./functions/get_filename.sh)
	fileCrc="${filename%.*}.crc"

	./functions/navigate_to_file.sh "${fileCrc}"

	echo "1"; exit
fi

echo "0"

