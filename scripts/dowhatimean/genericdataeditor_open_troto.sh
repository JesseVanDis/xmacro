#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

strokeDelay="40"
strokeDelayLong="200"

t=~/.xmacro/.cache/t

if [[ "$WindowTitle" = *"Generic Data Editor "* ]]; then

#	notify-send "Xmacro" "$WindowTitle"

	chmod 666 ~/projects/rr-tournament/assets/promo/promos-dev.json

	echo "#" > $t
	echo "DelayMs 40" >> $t


	echo "KeyStrPress Control_L" >> $t
	echo "KeyStrPress Alt_L" >> $t
	echo "KeyStrPress KP_Home" >> $t
	echo "KeyStrRelease KP_Home" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "KeyStrRelease Control_L" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "KeyStrRelease Alt_L" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "MotionNotify 58 142" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "MotionNotify 326 87" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "MotionNotify 287 196" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "MotionNotify 273 513" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "MotionNotify 349 166" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t

	echo "DelayMs 2000" >> $t


	echo "MotionNotify 20 397" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelayLong" >> $t
	echo "MotionNotify 165 426" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelay" >> $t

	for ((i=1;i<=287;i++)); 
	do 
		echo "KeyStrPress Down" >> $t
		echo "KeyStrRelease Down" >> $t
		echo "DelayMs 20" >> $t
	done

	echo "MotionNotify 29 856" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelay" >> $t

	echo "KeyStrPress Down" >> $t
	echo "KeyStrRelease Down" >> $t
	echo "DelayMs $strokeDelay" >> $t


	#for ((i=1;i<=30;i++)); 
	#do 
	#	echo "KeyStrPress Down" >> $t
	#	echo "KeyStrRelease Down" >> $t
	#	echo "DelayMs 20" >> $t
	#done



	echo "DelayMs $strokeDelay" >> $t
	echo "MotionNotify 87 849" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	
	for ((i=1;i<=18;i++)); 
	do 
		echo "KeyStrPress Down" >> $t
		echo "KeyStrRelease Down" >> $t
		echo "DelayMs 20" >> $t
	done
                  
	echo "DelayMs $strokeDelay" >> $t
	echo "MotionNotify 37 856" >> $t
	echo "ButtonPress 1" >> $t
	echo "DelayMs $strokeDelay" >> $t
	echo "ButtonRelease 1" >> $t
	echo "DelayMs $strokeDelay" >> $t

	for ((i=1;i<=6;i++)); 
	do 
		echo "KeyStrPress Down" >> $t
		echo "KeyStrRelease Down" >> $t
		echo "DelayMs 20" >> $t
	done
                  
                  
	~/.xmacro/xmacroplay -d 0 "$DISPLAY" < $t > ~/.xmacro/.cache/garbage

	echo "1"; exit

fi

echo "0"

