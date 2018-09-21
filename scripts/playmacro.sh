
if [ -f ~/.macro/scripts/macro_a_recording.bool ]; then
	notify-send "Xmacro" "Recording ended"
	rm -rf ~/.macro/scripts/macro_a_recording.bool
else
	if [ ! -f ~/.macro/scripts/macro_a_playing.bool ]; then
		echo "playing" > ~/.macro/scripts/macro_a_playing.bool
#		~/.macro/xmacroplay -d 50 -f $1 "$DISPLAY" < ~/.macro/xmacro/macro_a.txt
#		if [ ! -z "$1" ]; then 
#			~/.macro/xmacroplay -f $1 "$DISPLAY" < ~/.macro/scripts/macro_a.txt
#		else
#			~/.macro/xmacroplay "$DISPLAY" < ~/.macro/scripts/macro_a.txt
#		fi

		if [ -f ~/.macro/scripts/macro_speed.txt ]; then
			speed=$(head -n 1 ~/.macro/scripts/macro_speed.txt)
			~/.macro/xmacroplay -f $speed "$DISPLAY" < ~/.macro/scripts/macro_a.txt
		else
			~/.macro/xmacroplay "$DISPLAY" < ~/.macro/scripts/macro_a.txt			
		fi	

		rm -rf ~/.macro/scripts/macro_a_playing.bool
	fi
fi

