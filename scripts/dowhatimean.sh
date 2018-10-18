#!/bin/bash
cd "$(dirname "$0")"

rm -rf ~/.xmacro/.cache/line
rm -rf ~/.xmacro/.cache/selectedtext

windowTitle=$(xdotool getwindowfocus getwindowname)
windowProcess=$(ps -e | grep $(xdotool getwindowpid $(xdotool getwindowfocus)) | grep -v grep | awk '{print $4}')

echo "$windowTitle" > ~/.xmacro/.cache/windowTitle.txt
echo "$windowProcess" > ~/.xmacro/.cache/windowProcess.txt

#notify-send "Xmacro" "$windowProcess"

didExecute="0"
cd ./dowhatimean

thingToDoNext=""
thingToIgnore=""
#echo "" > ~/text.txt

if [ -f "./priorities.txt" ]; then
	while IFS= read -r line
	do
#		echo "${line}" >> ~/text.txt
		if [[ "$line" = *"[f]"* ]]; then
			functionName=${line:3}
			echo "trying function: ${functionName}.sh"
			functionResult=$(./functions/${functionName}.sh)
			if [ "${functionName}" = "get_selected_text" ]; then
				word="${functionResult}"

				isTime="0"
				if [ "${#word}" = "20" ] && [ "${word:0:1}" = "1" ]; then
					isTime="1"
				elif [ "${#word}" = "11" ] && [ "${word:0:1}" = "6" ]; then
					isTime="1"
				fi

				# probably golang time
				if [ "${isTime}" = "1" ]; then
					thingToDoNext="golang_a_walltotime"
				fi
			fi
		else
			if [ ! "${thingToIgnore}" = "${line}" ]; then
				f="./${line}.sh"
				echo "trying: ${f}"
				didExecute=$($f)
				if [ "${didExecute}" = "1" ]; then
					echo "executed ${f}!"
					break
				fi
			else
				echo "ignoring: ${f} (done before)"				
			fi
		fi

		if [ ! -z "${thingToDoNext}" ]; then
			f="./${thingToDoNext}.sh"
			echo "trying: ${f} with priority"
			didExecute=$($f)
			if [ "${didExecute}" = "1" ]; then
				echo "executed ${f}!"
				break
			fi
			thingToIgnore=${thingToDoNext} #todo: support multiple stuff
			thingToDoNext=""
		fi
	done < "./priorities.txt"
else
	for f in ./*.sh; do
		if [ ! "${f}" = "./header.sh" ]; then
			didExecute=$($f)
			if [ "${didExecute}" = "1" ]; then
				break
			fi
		fi
	done
fi

if [ "${didExecute}" = "0" ]; then
	# type the character `..
	clipboardContents=`xsel -ob`
#	notify-send "Xmacro" "$clipboardContents"
	printf "\`" | xsel -ib
	echo "#" > ~/.xmacro/.cache/k
	echo "DelayMs 20" >> ~/.xmacro/.cache/k
	echo "KeyStrPress Control_L" >> ~/.xmacro/.cache/k
	echo "KeyStrPress v" >> ~/.xmacro/.cache/k
	echo "DelayMs 10" >> ~/.xmacro/.cache/k
	echo "KeyStrRelease v" >> ~/.xmacro/.cache/k
	echo "DelayMs 10" >> ~/.xmacro/.cache/k
	echo "KeyStrRelease Control_L" >> ~/.xmacro/.cache/k
	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/k
	rm -rf ~/.xmacro/.cache/k
	printf "${clipboardContents}" | xsel -ib	
fi


