#!/bin/bash
cd "$(dirname "$0")"
source ./header.sh

#notify-send "Xmacro" "$WindowTitle"

#strokeDelay="${MinKeystrokeDelay}"
strokeDelay="15"

t=~/.xmacro/.cache/t


if [ "$IsTextEditor" = "1" ] && [[ "$WindowTitle" = *".go "* ]]; then
	wordUnderCursor=$(./functions/word_at_cursor.sh)

	# wall example: 13755602082817982997
	if [ "${#wordUnderCursor}" = "20" ] && [ "${wordUnderCursor:0:1}" = "1" ] ; then

		if [ -d ${GOROOT}/src/time ]; then
			if [ ! -f ${GOROOT}/src/time/timeextended.go ]; then
				xterm -e "echo 'time.go need to be edited so we can hack it to get proper data. type password to do so (since its in usr/local/go)' && sudo sh -c \"echo 'package time\n\nfunc (p *Time) SetWall(wall uint64) {\n    p.wall = wall\n}\n' > /usr/local/go/src/time/timeextended.go\""
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
				echo "	time := time.Now()" >> ./main.go
				echo "" >> ./main.go
				echo "	v, err := strconv.ParseUint(arg, 10, 64)" >> ./main.go
				echo "	if err != nil {" >> ./main.go
				echo "		fmt.Println(\"error: failed to parse '\" + arg + \"': \" + err.Error())" >> ./main.go
				echo "		return" >> ./main.go
				echo "	}" >> ./main.go
				echo "" >> ./main.go
				echo "	time.SetWall(v)" >> ./main.go
				echo "	fmt.Printf(\"%v\n\", time)" >> ./main.go
				echo "}" >> ./main.go
				go build
			fi
			notify-send "Xmacro" "$wordUnderCursor is time!!"
		fi
	else
		notify-send "Xmacro" "$GOROOT"
	fi 

	echo "1"; exit
fi

echo "0"

