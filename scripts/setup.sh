

dpkg -s xdotool 2>/dev/null >/dev/null || sudo apt-get -y install xdotool
dpkg -s libxtst-dev 2>/dev/null >/dev/null || sudo apt-get -y install libxtst-dev

if [ ! -d ./.xmacro ]; then
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
fi

echo "do [Windows key] \"keyboard\" and add the shortcut: "


