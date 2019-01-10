#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"CLion"* ]]; then

	# tip: you can also use: CTRL+SHIFT+C , it will instantly copy the file name

	p1=$(echo "$WindowTitle" | awk -F ']' '{print $2}')  #' - .../client/build/linux/debug/include/soldierbehaviours.hpp - CLion 2017.2.3'
	p2=$(echo "$p1" | awk -F '-' '{print $2}')  #' .../client/build/linux/debug/include/soldierbehaviours.hpp '
	p3=$(echo "$p2" | xargs) #'.../client/build/linux/debug/include/soldierbehaviours.hpp'
	res=$(basename "${p3}")
	printf "${res}"
else
	printf ""
fi



