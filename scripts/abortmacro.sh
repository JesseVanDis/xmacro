#!/bin/bash
cd "$(dirname "$0")"

if [ ! -f ~/.xmacro/.cache/abort.tmp ]; then
	notify-send "Xmacro" "Playing aborted"
	echo "" > ~/.xmacro/.cache/abort.tmp
	sleep 2
fi
rm -rf ~/.xmacro/.cache/abort.tmp

