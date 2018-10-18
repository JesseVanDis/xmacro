#!/bin/bash
cd "$(dirname "$0")"
source ../header.sh

#usage:  [text][amount of words to skip]

word=$(echo "${1}" | awk "{ print \$${2} }")

printf "$word"

