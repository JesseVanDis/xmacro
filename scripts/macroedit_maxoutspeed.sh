#!/bin/bash
cd "$(dirname "$0")"

input=$1

iterationIndex=0

cp $input ./temp.txt~

iterate()
{
	if [ -f ./temp2.txt~ ]; then
		rm -rf ./temp2.txt~
	fi

	lastLine=""

	while IFS= read -r line; do
		if [[ "$lastLine" = *"KeyStrPress "* ]] && [[ "$line" = *"DelayMs "* ]]; then
			line=""
		elif [[ "$line" = *"DelayMs "* ]]; then
			line="DelayMs 1.5"
		fi

		if [ ! "$line" = "" ]; then
			echo "$line" >> ./temp2.txt~
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



