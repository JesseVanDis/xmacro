#!/bin/bash
cd "$(dirname "$0")"

input=$1

iterationIndex=0
minDelay=${2}
minDelaySameKey=${3}

if [ -z "${minDelay}" ]; then
	# 1.5 is shorting in input mode
	# 40 is shortest in vim mode
	minDelay="40"
fi

cp $input ./temp.txt~

iterate()
{
	if [ -f ./temp2.txt~ ]; then
		rm -rf ./temp2.txt~
	fi

	lastLine=""
	lastValidLine=""
	secondLastValidLine=""

	while IFS= read -r line; do
		if [[ "$lastLine" = *"KeyStrPress "* ]] && [[ "$line" = *"DelayMs "* ]]; then
			line=""
		elif [[ "$line" = *"DelayMs "* ]]; then
#			line="DelayMs 1.5"

			if [ ! -z "$minDelaySameKey" ]; then
				lastKey=$(echo "$lastValidLine" | awk -F ' ' '{print $2}')
				if [ "$lastValidLine" = "KeyStrRelease ${lastKey}" ] && [[ "$secondLastValidLine" = "KeyStrPress ${lastKey}" ]]; then
					line="DelayMs ${minDelaySameKey}"
				else
					line="DelayMs ${minDelay}"
				fi				
			else
				line="DelayMs ${minDelay}"
			fi			
		fi

		if [ ! "$line" = "" ]; then
			echo "$line" >> ./temp2.txt~
			secondLastValidLine=$lastValidLine
			lastValidLine=$line
		fi
		lastLine=$line
	done < ./temp.txt~
	rm ./temp.txt~
	mv ./temp2.txt~ ./temp.txt~
}


iterationIndex=0
iterate

while IFS= read -r line; do
	echo $line
done < ./temp.txt~
rm -rf ./temp.txt~



