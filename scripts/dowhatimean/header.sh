#!/bin/bash

export GOPATH=$(pwd)/go
export CLionExecutable=~/Applications/CLion/bin/clion.sh

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

export IsCLion="0"
if [[ "$WindowTitle" = *"CLion"* ]]; then
	export IsCLion="1"
fi

export IsSublime="0"
if [[ "$WindowTitle" = *"Sublime Text"* ]]; then
	export IsSublime="1"
fi

export IsLibreOfficeCalc="0"
if [[ "$WindowTitle" = *"LibreOffice Calc"* ]]; then
	export IsLibreOfficeCalc="1"
fi

if [[ "$WindowTitle" = *"gedit"* ]] || [[ "$WindowTitle" = *"Visual Studio Code"* ]] || [ "${IsCLion}" = "1" ] || [ "${IsSublime}" = "1" ]; then
	export IsTextEditor="1"
else
	export IsTextEditor="0"
fi

