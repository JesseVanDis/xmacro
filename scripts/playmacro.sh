#!/bin/bash
cd "$(dirname "$0")"

if [ -f ~/.xmacro/scripts/macro_${1}_recording.bool ]; then
	notify-send "Xmacro" "Recording ended"
	./macroedit_cleanup.sh ~/.xmacro/scripts/macro_${1}.txt > ~/.xmacro/scripts/macro_${1}_clean.txt
	rm -rf ~/.xmacro/scripts/macro_${1}.txt
	mv ~/.xmacro/scripts/macro_${1}_clean.txt ~/.xmacro/scripts/macro_${1}.txt
	rm -rf ~/.xmacro/scripts/macro_${1}_recording.bool
	./macroedit_maxoutspeed.sh ~/.xmacro/scripts/macro_${1}.txt "1.5" > ~/.xmacro/scripts/macro_${1}_max.txt
	./macroedit_maxoutspeed.sh ~/.xmacro/scripts/macro_${1}.txt "40" > ~/.xmacro/scripts/macro_${1}_maxvim.txt
else
#	if [ ! -f ~/.xmacro/scripts/macro_${1}_playing.bool ]; then
#		echo "playing" > ~/.xmacro/scripts/macro_${1}_playing.bool
#		~/.xmacro/xmacroplay -d 50 -f $1 "$DISPLAY" < ~/.xmacro/xmacro/macro_${1}.txt
#		if [ ! -z "$1" ]; then 
#			~/.xmacro/xmacroplay -f $1 "$DISPLAY" < ~/.xmacro/scripts/macro_${1}.txt
#		else
#			~/.xmacro/xmacroplay "$DISPLAY" < ~/.xmacro/scripts/macro_${1}.txt
#		fi

		if [ -f ~/.xmacro/scripts/macro_speed.txt ]; then
			speed=$(head -n 1 ~/.xmacro/scripts/macro_speed.txt)
			if [ "${speed}" = "max" ]; then
#				./macroedit_maxoutspeed.sh ~/.xmacro/scripts/macro_${1}.txt "1.5" > ~/.xmacro/scripts/macro_${1}_max.txt
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/scripts/macro_${1}_max.txt
			elif [ "${speed}" = "maxvim" ]; then
#				./macroedit_maxoutspeed.sh ~/.xmacro/scripts/macro_${1}.txt "40" > ~/.xmacro/scripts/macro_${1}_maxvim.txt
				~/.xmacro/xmacroplay -d 0 "$DISPLAY" < ~/.xmacro/scripts/macro_${1}_maxvim.txt
			else
				~/.xmacro/xmacroplay -f $speed "$DISPLAY" < ~/.xmacro/scripts/macro_${1}.txt
			fi
		else
			~/.xmacro/xmacroplay "$DISPLAY" < ~/.xmacro/scripts/macro_${1}.txt			
		fi	

		rm -rf ~/.xmacro/scripts/macro_${1}_playing.bool
#	else
#		notify-send "Xmacro" "Already playing"	
#	fi
fi

