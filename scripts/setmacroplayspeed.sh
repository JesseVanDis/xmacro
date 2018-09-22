if [ "$1" = "max" ]; then
	notify-send "Xmacro" "Play speed set to: Max"
else
	notify-send "Xmacro" "Play speed set to: 1 / $1"
fi

echo "$1" > ~/.xmacro/scripts/macro_speed.txt

