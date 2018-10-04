#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

lineUnderCursorResult="${1}"

cursorIndex=""
for i in $(seq 1 ${#lineUnderCursorResult}); do
	if [ "${lineUnderCursorResult:i-1:1}" = ":" ]; then
		if [ -z "$cursorIndex" ]; then
			printf "0"
		else
			printf "$cursorIndex"
		fi
		exit
	else
	cursorIndex="${cursorIndex}${lineUnderCursorResult:i-1:1}"
	fi
done
printf "0"

