#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="15"

t=~/.xmacro/.cache/t


if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *".go "* ]]; then
	word=$(./functions/get_selected_text.sh)

	isLongTime="0"
	isShortTime="0"
	isTime="0"
	if [ "${#word}" = "20" ] && [ "${word:0:1}" = "1" ]; then
		# golang wall example: 13755602082817982997
		isLongTime="1"
		isTime="1"
	elif [ "${#word}" = "11" ] && [ "${word:0:1}" = "6" ]; then
		# golang example: 63669398400
		isShortTime="1"
		isTime="1"
	fi

	if [ ! "${isTime}" = "1" ]; then
		word=$(./functions/word_at_cursor.sh)
	fi

	if [ "${isTime}" = "1" ] ; then

		if [ -d ${GOROOT}/src/time ]; then
			if [ ! -f ${GOROOT}/src/time/timeextended.go ]; then
				xterm -e "echo 'time.go need to be edited so we can hack it to get proper data. type password to do so (since its in ${GOROOT})' && sudo sh -c \"echo 'package time\n\nfunc (p *Time) SetWall(wall uint64) {\n    p.wall = wall\n}\nfunc (p *Time) SetExt(ext int64) {\n    p.ext = ext\n}' > ${GOROOT}/src/time/timeextended.go\""
			fi
		fi

		if [ -f ${GOROOT}/src/time/timeextended.go ]; then
			if [ ! -d ~/.xmacro/.cache/getgotime ]; then
				mkdir -p ~/.xmacro/.cache/getgotime
				cd ~/.xmacro/.cache/getgotime

				echo "" > ./main.go
				echo "package main" >> ./main.go
				echo "" >> ./main.go
				echo "import (" >> ./main.go
				echo "	\"fmt\"" >> ./main.go
				echo "	\"strconv\"" >> ./main.go
				echo "	\"time\"" >> ./main.go
				echo "	\"os\"" >> ./main.go
				echo ")" >> ./main.go
				echo "" >> ./main.go
				echo "func main() {" >> ./main.go
				echo "	argsWithoutProg := os.Args[1:]" >> ./main.go
				echo "	arg := argsWithoutProg[0] //\"13755602082817982997\"" >> ./main.go
				echo "	arg2 := argsWithoutProg[1]// \"63669398400\"" >> ./main.go
				echo "	time := time.Now()" >> ./main.go
				echo "" >> ./main.go
				echo "	v, err := strconv.ParseUint(arg, 10, 64)" >> ./main.go
				echo "	if err != nil {" >> ./main.go
				echo "		fmt.Println(\"error: failed to parse '\" + arg + \"': \" + err.Error())" >> ./main.go
				echo "		return" >> ./main.go
				echo "	}" >> ./main.go
				echo "" >> ./main.go
				echo "	v2, err2 := strconv.ParseInt(arg2, 10, 64)" >> ./main.go
				echo "	if err2 != nil {" >> ./main.go
				echo "		fmt.Println(\"error: failed to parse2 '\" + arg2 + \"': \" + err2.Error())" >> ./main.go
				echo "		return" >> ./main.go
				echo "	}" >> ./main.go
				echo "" >> ./main.go
				echo "	time.SetWall(v)" >> ./main.go
				echo "	time.SetExt(v)" >> ./main.go
				echo "	fmt.Printf(\"%v\n\", time.UnixNano())" >> ./main.go
				echo "}" >> ./main.go
				go build
			fi
			#notify-send "Xmacro" "$word is time!!"
			if [ "${isLongTime}" = "1" ]; then
				epochNano=$(~/.xmacro/.cache/getgotime/getgotime "${word}" "0")
			else
				epochNano=$(~/.xmacro/.cache/getgotime/getgotime "0" "${word}")				
			fi
			timestr=$(./functions/unix_nano_to_string.sh ${epochNano})
			notify-send "Xmacro" "${timestr}"
		fi
		
		if [ ! -f ~/.xmacro/.cache/getgotime/getgotime ]; then
			# building failed.. delete the hack thing so we can try again on the next attempt
			xterm -e "echo 'building the time fetch tool failed. want to remove the go time.go hack now. type password to do so (since its in ${GOROOT})' && sudo sh -c \"rm -rf ${GOROOT}/src/time/timeextended.go\""
			rm -rdf ~/.xmacro/.cache/getgotime
		fi

	else
		notify-send "Xmacro" "$wordUnderCursor"
	fi 

	echo "1"; exit
fi

echo "0"

