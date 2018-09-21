
dpkg -s xdotool 2>/dev/null >/dev/null || sudo apt-get -y install xdotool
dpkg -s libxtst-dev 2>/dev/null >/dev/null || sudo apt-get -y install libxtst-dev

if [ ! -d ./xmacro ]; then
	mkdir ./xmacro
	cd ./xmacro
	git clone https://github.com/PrimeVest/xmacro

	cd ./xmacro
	make all
fi

echo "do [Windows key] \"keyboard\" and add the shortcut: 



