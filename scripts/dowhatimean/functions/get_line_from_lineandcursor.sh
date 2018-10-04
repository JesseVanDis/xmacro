#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

lineUnderCursorResult="${1}"

line=""
for i in $(seq 1 ${#lineUnderCursorResult}); do
	if [ "${lineUnderCursorResult:i-1:1}" = ":" ]; then
		line=${lineUnderCursorResult:i}
		break
	fi
done
printf "$line"

