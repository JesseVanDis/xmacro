#!/bin/bash
cd "$(dirname "$0")"


windowId=$(xdotool getwindowfocus)

#xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p' > ./keylog.txt &
xev > ./keylog.txt &


i=0
while [ $i -lt 500 ]
do

	while IFS= read -r line; do
		if [[ "$line" = *"KeyRelease"* ]]; then
			echo "Key release found! exiting..."
			i=999999
		fi

	done < ./keylog.txt

	echo $i
	i=`expr $i + 1`
done

# todo: close xev
#sleep 0.1 #should work....


