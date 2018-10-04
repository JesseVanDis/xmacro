#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

#usage:  [cursor column][text][(amount of words to skip)]


if [ -z "${1}" ]; then
	lineUnderCursorResult=$(./get_line_and_cursor_column.sh)

	cursorIndex=$(./get_cursor_from_lineandcursor.sh "${lineUnderCursorResult}")
	line=$(./get_line_from_lineandcursor.sh "${lineUnderCursorResult}")
	wordAtCursor=$(./word_at_cursor.sh ${cursorIndex} "${line}")
	printf "$wordAtCursor"
	exit
fi


wordStartIndex=0
wordIndex=""
wordLength=0
shouldSelect=0
word=""
text="${2} "
ind=$(($1 + 1))
justSelected="0"
skip="0"
if [ ! -z "${3}" ]; then
	skip=${3}
fi
#notify-send "Xmacro" "skip: '${skip}'"

for i in $(seq 1 ${#text})
do
	justSelected="0"
	c1=${text:i-1:1}
	#echo "${i} (${text:i-1:1})"

	if [ "${ind}" = "${i}" ]; then
		#echo "select"
		shouldSelect=1
		#justSelected="1"
	fi

	if [ "$c1" = " " ] || [ "$c1" = "\t" ]; then
		word=${text:$wordStartIndex:$wordLength}
		if [ "${shouldSelect}" == "1" ] && [ "$justSelected" == "0" ]; then
			if [ "${skip}" = "0" ]; then
				break
			fi
			skip=$(($skip - 1))
		fi
		wordLength=0
		wordStartIndex="${i}"
	else
		wordLength=$(($wordLength + 1))
	fi
done

printf "$word"

