#!/bin/bash
cd "$(dirname "$0")"

dpkg -s xdotool 2>/dev/null >/dev/null || sudo apt-get -y install xdotool
dpkg -s libxtst-dev 2>/dev/null >/dev/null || sudo apt-get -y install libxtst-dev

if [ ! -d ~/.xmacro ]; then
	mkdir ~/.xmacrogit
	cd ~/.xmacrogit
	git clone https://github.com/PrimeVest/xmacro
	rm -rdf ~/xmacro
	mv ~/.xmacrogit/xmacro/ ~/
	cd ~/
	mv xmacro .xmacro
	rm -rdf ~/.xmacrogit
	cd ~/.xmacro
	rm -rdf ~/.xmacro/xmacro
	make all

	#Super key:                 <Super>
	#Control key:               <Primary> or <Control>
	#Alt key:                   <Alt>
	#Shift key:                 <Shift>
	#numbers:                   1 (just the number)
	#Spacebar:                  space
	#Slash key:                 slash
	#Asterisk key:              asterisk (so it would need `<Shift>` as well)
	#Ampersand key:             ampersand (so it would need <Shift> as well)

	#a few numpad keys:
	#Numpad divide key (`/`):   KP_Divide
	#Numpad multiply (Asterisk):KP_Multiply
	#Numpad number key(s):      KP_1
	#Numpad `-`:                KP_Subtract

	cd "$(dirname "$0")"

	homeDir=$(eval echo "~$USER")
	python3 ./keybindings.py 'record macro' "${homeDir}/.xmacro/scripts/recordmacro.sh" '<Alt>1'
	python3 ./keybindings.py 'end/play macro' "${homeDir}/.xmacro/scripts/playmacro.sh" 'F1'
	python3 ./keybindings.py 'set macro playspeed X1' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 1" '<Control>1'
	python3 ./keybindings.py 'set macro playspeed X2' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.5" '<Control>2'
	python3 ./keybindings.py 'set macro playspeed X4' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.25" '<Control>3'
	python3 ./keybindings.py 'set macro playspeed X10' "${homeDir}/.xmacro/scripts/setmacroplayspeed.sh 0.1" '<Control>4'
fi


