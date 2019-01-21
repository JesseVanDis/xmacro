#!/bin/bash
cd "$(dirname "$0")"
cd ./dowhatimean

rm -rf ~/.xmacro/.cache/line
rm -rf ~/.xmacro/.cache/selectedtext
windowTitle=$(xdotool getwindowfocus getwindowname)
windowProcess=$(ps -e | grep $(xdotool getwindowpid $(xdotool getwindowfocus)) | grep -v grep | awk '{print $4}')
echo "$windowTitle" > ~/.xmacro/.cache/windowTitle.txt
echo "$windowProcess" > ~/.xmacro/.cache/windowProcess.txt

source ./header.sh
cd ../


if [ -f ~/.xmacro/.cache/macro_${1}_recording.bool ]; then
	notify-send "Xmacro" "Recording ended"
	./macroedit_cleanup.sh ~/.xmacro/.cache/macro_${1}.txt > ~/.xmacro/.cache/macro_${1}_clean.txt
	rm -rf ~/.xmacro/.cache/macro_${1}.txt
	mv ~/.xmacro/.cache/macro_${1}_clean.txt ~/.xmacro/.cache/macro_${1}.txt
	rm -rf ~/.xmacro/.cache/macro_${1}_recording.bool
	./macroedit_maxoutspeed.sh ~/.xmacro/.cache/macro_${1}.txt "1.5" > ~/.xmacro/.cache/macro_${1}_max.txt
	./macroedit_maxoutspeed.sh ~/.xmacro/.cache/macro_${1}.txt "40" > ~/.xmacro/.cache/macro_${1}_maxvim.txt
	./macroedit_maxoutspeed.sh ~/.xmacro/.cache/macro_${1}.txt "80" "10" > ~/.xmacro/.cache/macro_${1}_maxclion.txt
else
#	if [ ! -f ~/.xmacro/.cache/macro_${1}_playing.bool ]; then
#		echo "playing" > ~/.xmacro/.cache/macro_${1}_playing.bool
#		~/.xmacro/xmacroplay -d 50 -f $1 "$DISPLAY" < ~/.xmacro/xmacro/macro_${1}.txt
#		if [ ! -z "$1" ]; then 
#			~/.xmacro/xmacroplay -f $1 "$DISPLAY" < ~/.xmacro/.cache/macro_${1}.txt
#		else
#			~/.xmacro/xmacroplay "$DISPLAY" < ~/.xmacro/.cache/macro_${1}.txt
#		fi

		if [ -f ~/.xmacro/.cache/macro_speed.txt ]; then
			speed=$(head -n 1 ~/.xmacro/.cache/macro_speed.txt)
			
			if [ "${IsCLion}" = "1" ]; then
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/macro_${1}_maxclion.txt				
			elif [ "${IsSublime}" = "1" ]; then
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/macro_${1}_max.txt				
			elif [ "${IsLibreOfficeCalc}" = "1" ]; then
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/macro_${1}_max.txt				
			elif [ "${speed}" = "max" ]; then
#				./macroedit_maxoutspeed.sh ~/.xmacro/.cache/macro_${1}.txt "1.5" > ~/.xmacro/.cache/macro_${1}_max.txt
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/macro_${1}_max.txt
			elif [ "${speed}" = "maxvim" ]; then
#				./macroedit_maxoutspeed.sh ~/.xmacro/.cache/macro_${1}.txt "40" > ~/.xmacro/.cache/macro_${1}_maxvim.txt
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/.cache/macro_${1}_maxvim.txt
			else
				~/.xmacro/xmacroplay -f $speed "$DISPLAY" < ~/.xmacro/.cache/macro_${1}.txt
			fi
		else
			~/.xmacro/xmacroplay "$DISPLAY" < ~/.xmacro/.cache/macro_${1}.txt			
		fi	

		rm -rf ~/.xmacro/.cache/macro_${1}_playing.bool
#	else
#		notify-send "Xmacro" "Already playing"	
#	fi
fi

