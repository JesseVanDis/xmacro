#!/bin/bash
cd "$(dirname "$0")"

unixNano="${1}"
unixSecond="${1:0:-9}"

date -d @${unixSecond} +' date: %d-%m-%Y . . . . . time: %H:%M:%S'  # small endian



