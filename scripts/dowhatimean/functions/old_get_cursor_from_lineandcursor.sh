#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

lineUnderCursorResult=${1}

cursorIndex="0"
line=""
for i in $(seq 1 ${#lineUnderCursorResult}); do
	if [ "${lineUnderCursorResult:i-1:1}" = ":" ]; then
		cursorIndex=${lineUnderCursorResult:0:1}
		line=${lineUnderCursorResult:i}
		break
	fi
done

printf "$cursorIndex"

