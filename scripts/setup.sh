
if [ ! -d ./xmacro ]; then

	sudo apt-get install libxtst-dev

	mkdir ./xmacro
	cd ./xmacro
	git clone https://github.com/PrimeVest/xmacro

	cd ./xmacro
	make all
fi

echo "do [Windows key] \"keyboard\" and add the shortcut: 



