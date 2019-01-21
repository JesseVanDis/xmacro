#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

strokeDelay="20"
pasteDelay="40"
t=~/.xmacro/.cache/t


if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *"rr2"* ]] && [[ "$WindowTitle" = *".cpp"* ]] && [[ ! "$WindowTitle" = *"_bdef"* ]]; then
	selectedText=$(./functions/get_target_word.sh)

	ok="0"
	isInt="0"

	if [ "$selectedText" = "s_a" ] || [ "$selectedText" = "s_b" ] || [ "$selectedText" = "s_c" ] || [ "$selectedText" = "s_d" ] || [ "$selectedText" = "s_e" ] || [ "$selectedText" = "s_f" ] || [ "$selectedText" = "s_g" ]; then		
		ok="1"
	elif [ "$selectedText" = "s_i" ]; then		
		ok="1"
		isInt="1"
	fi

	if [ "$ok" = "1" ]; then		

		clipboardContents=`xsel -ob`

		if [ "$isInt" = "1" ]; then
			printf "KEEN_DEFINE_INT_VARIABLE(___, "---", 0, -10000, 10000, \"\");" | xclip -selection clipboard
		else
			printf "KEEN_DEFINE_PF32_VARIABLE(___, "---", 0, -2000, 2000, \"\");" | xclip -selection clipboard
		fi
#		notify-send "Xmacro" "'$selectedText'"

		echo "#" > $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Home" >> $t
		echo "KeyStrRelease Home" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress End" >> $t
		echo "KeyStrRelease End" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $pasteDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

		printf "$selectedText" | xclip -selection clipboard

		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Home" >> $t
		echo "KeyStrRelease Home" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $pasteDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		printf "\"${selectedText:1}\"" | xclip -selection clipboard

		echo "#" > $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Shift_L" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Right" >> $t
		echo "KeyStrRelease Right" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease Shift_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrPress Control_L" >> $t
		echo "KeyStrPress v" >> $t
		echo "KeyStrRelease Control_L" >> $t
		echo "DelayMs $strokeDelay" >> $t
		echo "KeyStrRelease v" >> $t
		echo "DelayMs $pasteDelay" >> $t
		echo "KeyStrPress Home" >> $t
		echo "KeyStrRelease Home" >> $t
		echo "DelayMs $strokeDelay" >> $t

		~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
		printf "${clipboardContents}" | xsel -ib
		
		echo "1"; exit
	fi

fi

echo "0"

