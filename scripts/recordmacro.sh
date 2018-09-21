echo "isrecording" > ~/.macro/scripts/macro_a_recording.bool
notify-send "Xmacro" "Recording started"
~/.macro/xmacrorec2 -r -k 67 > ~/.macro/scripts/macro_a.txt
