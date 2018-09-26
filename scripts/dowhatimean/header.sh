#!/bin/bash

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

