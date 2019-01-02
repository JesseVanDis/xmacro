#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
minStrokeDelay="15"
tabStrokeDelay="100"
siteLoadingDelay="1500"
copyDelay="70"

t=~/.xmacro/.cache/web


if [[ "$WindowTitle" = *"Google"* ]] && [[ "$WindowTitle" = *"alender"* ]] && [[ "$WindowTitle" = *"Chrome"* ]]; then
#	notify-send "Xmacro" "kalender!!"


	clipboardContents=`xsel -ob`
	#printf "fmt.Println(\"error: id $uniqueId\")" | xclip -selection clipboard

	echo "#" > $t
	echo "DelayMs $minStrokeDelay" >> $t

	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress a" >> $t
	echo "KeyStrRelease a" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress c" >> $t
	echo "KeyStrRelease c" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs $copyDelay" >> $t

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
	calenderCharacter=`xsel -ob`

	notify-send "Xmacro" "${#calenderCharacter}"

	start="7:00"
	end="16:00"

	if [[ "$calenderCharacter" = "g" ]] || [[ "$calenderCharacter" = "G" ]]; then
		start="7:00"
		end="16:00"
	elif [[ "$calenderCharacter" = "a" ]] || [[ "$calenderCharacter" = "A" ]]; then
		start="6:00"
		end="15:00"
	elif [[ "$calenderCharacter" = "b" ]] || [[ "$calenderCharacter" = "B" ]]; then
		start="8:00"
		end="17:00"
	elif [[ "$calenderCharacter" = "c" ]] || [[ "$calenderCharacter" = "C" ]]; then
		start="14:00"
		end="23:00"
	elif [[ "$calenderCharacter" = "d" ]] || [[ "$calenderCharacter" = "D" ]]; then
		start="15:00"
		end="24:00"
	elif [[ "$calenderCharacter" = "e" ]] || [[ "$calenderCharacter" = "E" ]]; then
		start="22:00"
		end="7:00"
	elif [[ "$calenderCharacter" = "f" ]] || [[ "$calenderCharacter" = "F" ]]; then
		start="12:00"
		end="21:00"
	elif [[ "$calenderCharacter" = "o" ]] || [[ "$calenderCharacter" = "O" ]]; then
		start="09:00"
		end="18:00"
	elif [[ "$calenderCharacter" = "am" ]] || [[ "$calenderCharacter" = "AM" ]]|| [[ "$calenderCharacter" = "aM" ]]|| [[ "$calenderCharacter" = "Am" ]]; then
		start="13:00"
		end="22:00"
	elif [[ "$calenderCharacter" = "h" ]] || [[ "$calenderCharacter" = "H" ]]; then
		start="10:00"
		end="19:00"
	else
		notify-send "Xmacro" "'$calenderCharacter' is not a valid character"
		printf "${clipboardContents}" | xsel -ib
		echo "1"; exit
	fi

	printf "${start}" | xsel -ib


	echo "#" > $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress End" >> $t
	echo "KeyStrRelease End" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Return" >> $t
	echo "KeyStrRelease Return" >> $t
	echo "DelayMs $siteLoadingDelay" >> $t
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress a" >> $t
	echo "KeyStrRelease a" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs 100" >> $t 				# typing 'work' from here on
	echo "KeyStrPress w" >> $t
	echo "KeyStrRelease w" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress o" >> $t
	echo "KeyStrRelease o" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress r" >> $t
	echo "KeyStrRelease r" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress k" >> $t
	echo "KeyStrRelease k" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress space" >> $t
	echo "KeyStrRelease space" >> $t
	echo "DelayMs 300" >> $t 				# spacebar to toggle 'full day'
	echo "KeyStrPress Shift_L" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrRelease Shift_L" >> $t
	echo "DelayMs 100" >> $t 				# open start time dropdown
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress v" >> $t
	echo "KeyStrRelease v" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs 100" >> $t 				# pasted start time

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
	printf "${end}" | xsel -ib

	echo "#" > $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs 100" >> $t 				# open end time dropdown
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress v" >> $t
	echo "KeyStrRelease v" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs 100" >> $t 				# pasted end time

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

	echo "#" > $t
	echo "KeyStrPress Shift_L" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $minStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrPress Tab" >> $t
	echo "KeyStrRelease Tab" >> $t
	echo "DelayMs $tabStrokeDelay" >> $t
	echo "KeyStrRelease Shift_L" >> $t
	echo "DelayMs 100" >> $t 	# confirm button
	echo "KeyStrPress Return" >> $t
	echo "KeyStrRelease Return" >> $t
	echo "DelayMs $minStrokeDelay" >> $t

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

	printf "${clipboardContents}" | xsel -ib
	echo "1"; exit

	rm -rf $t

fi
echo "0"





