#!/bin/bash
cd "$(dirname "$0")"

if [ -f ~/.xmacro/scripts/macro_a_recording.bool ]; then
	notify-send "Xmacro" "Recording ended"
	./cleanupmacro.sh ~/.xmacro/scripts/macro_a.txt > ~/.xmacro/scripts/macro_a_clean.txt
	rm -rf ~/.xmacro/scripts/macro_a.txt
	mv ~/.xmacro/scripts/macro_a_clean.txt ~/.xmacro/scripts/macro_a.txt
	rm -rf ~/.xmacro/scripts/macro_a_recording.bool
else
	if [ ! -f ~/.xmacro/scripts/macro_a_playing.bool ]; then
		echo "playing" > ~/.xmacro/scripts/macro_a_playing.bool
#		~/.xmacro/xmacroplay -d 50 -f $1 "$DISPLAY" < ~/.xmacro/xmacro/macro_a.txt
#		if [ ! -z "$1" ]; then 
#			~/.xmacro/xmacroplay -f $1 "$DISPLAY" < ~/.xmacro/scripts/macro_a.txt
#		else
#			~/.xmacro/xmacroplay "$DISPLAY" < ~/.xmacro/scripts/macro_a.txt
#		fi

		if [ -f ~/.xmacro/scripts/macro_speed.txt ]; then
			speed=$(head -n 1 ~/.xmacro/scripts/macro_speed.txt)
			~/.xmacro/xmacroplay -f $speed "$DISPLAY" < ~/.xmacro/scripts/macro_a.txt
		else
			~/.xmacro/xmacroplay "$DISPLAY" < ~/.xmacro/scripts/macro_a.txt			
		fi	

		rm -rf ~/.xmacro/scripts/macro_a_playing.bool
	fi
fi

