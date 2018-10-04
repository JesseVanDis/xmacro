#!/bin/bash

export GOPATH=$(pwd)/go

if [ -d /usr/local/go ]; then
	export PATH=$PATH:/usr/local/go/bin
	export GOROOT=/usr/local/go
else
	export GOROOT=/usr/lib/go
fi
export PATH=$PATH:~/go/bin

#export SelectedText=""
export WordUnderCursor=""
export WindowTitle=$(head -n 1 ~/.xmacro/.cache/windowTitle.txt)
export WindowProcess=$(head -n 1 ~/.xmacro/.cache/windowProcess.txt)
export MinKeystrokeDelay=10
export RetVal=~/.xmacro/.cache/retval

if [[ "$WindowTitle" = *"gedit"* ]] || [[ "$WindowTitle" = *"Visual Studio Code"* ]] || [[ "$WindowTitle" = *"CLion"* ]]; then
	export IsTextEditor="1"
else
	export IsTextEditor="0"
fi

