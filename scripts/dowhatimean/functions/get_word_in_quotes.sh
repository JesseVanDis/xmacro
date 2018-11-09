#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

word="$1"
end=""

for i in $(seq 1 ${#word}); do
	if [ "${word:i-1:1}" = "\"" ]; then
		end=${word:i}
		break
	fi
done

result=""
for i in $(seq 1 ${#end}); do
	if [ "${end:i-1:1}" = "\"" ]; then
		if [ -z "$result" ]; then
			printf ""
		else
			printf "$result"
		fi
		exit
	else
	result="${result}${end:i-1:1}"
	fi
done
printf ""


