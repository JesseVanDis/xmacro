#!/bin/bash
cd "$(dirname "$0")"

input=$1

cleanupIterationIndex=0

cp $input ./temp.txt~

iterateCleanup()
{
	if [ -f ./temp2.txt~ ]; then
		rm -rf ./temp2.txt~
	fi
	line="#__"
	latestLine=""
	begin="1"
	pline="1"
	removeNextLine="0"
	lineIndex=-1
	while IFS= read -r nextLine; do
		pline="1"
		removeNextLine="0"
		if [ "$begin" = "0" ]; then
			if [ "${lineIndex}" == "0" ] && [ "$cleanupIterationIndex" = "1" ] && [[ "$line" = *"DelayMsUnscaled "* ]] && [[ "$nextLine" = *"DelayMs "* ]]; then
				pline="0"
				removeNextLine="1"
			fi
			if [[ "$line" = *"DelayMs "* ]] && [[ "$nextLine" = *"DelayMs "* ]]; then
				number=$(echo "$line" | awk '{print $2}')
				nextLineNumber=$(echo "$nextLine" | awk '{print $2}')
				totalNumber=$(($number + $nextLineNumber))
				#echo "number: ${totalNumber} (${number} + ${nextLineNumber})"
				line="DelayMs ${totalNumber}"
				pline="0"
				removeNextLine="1"
			fi
		fi

		if [ "$begin" = "1" ]; then
			pline="0"
		fi

	
		if [ "$pline" = "1" ] && [ ! "$line" = "" ]; then
			echo "$line" >> ./temp2.txt~
		fi
		if [ "$removeNextLine" == "0" ]; then
			line=$nextLine
		fi
		begin="0"
		latestLine=$nextLine
		lineIndex=$((lineIndex + 1))
	done < ./temp.txt~
	echo $latestLine >> ./temp2.txt~
	rm ./temp.txt~
	mv ./temp2.txt~ ./temp.txt~
}

cleanupIterationIndex=0
iterateCleanup

cleanupIterationIndex=1
iterateCleanup


while IFS= read -r line; do
	echo $line
done < ./temp.txt~
rm -rf ./temp.txt~



