#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

strokeDelay="40"
strokeDelayLong="200"

t=~/.xmacro/.cache/t

# || [ "$WindowTitle" = "mount" ]
if [ "$WindowProcess" = "nautilus" ]; then

	echo "DelayMs $strokeDelay" > $t
	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress c" >> $t
	echo "KeyStrRelease c" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs $strokeDelay" >> $t

	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage
	FileName=`xsel -ob`
	FileWithExtention=$(basename "$FileName")
	File="${FileWithExtention%.*}"

	if [[ "$FileName" = *".product" ]]; then
		chmod 666 "$FileName"

		From="(?<=output.name.)\".*\""
		To="\"${File}\""
		Query='s/'$From'/'$To'/g;'
		perl -pi -e $Query $FileName

		From="(?<=name..sourcepsd..).*(?=<)"
		To="\"${File}.psd\""
		Query='s/'$From'/'$To'/g;'
		perl -pi -e $Query $FileName

		echo "1"; exit
	fi
fi

echo "0"

