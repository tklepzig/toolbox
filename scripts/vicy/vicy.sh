#!/usr/bin/env zsh

if [ "$#" -ne 3 ]
then
	echo "Usage: vicy.sh [e|d] <key> <text|cipher>"
	exit 1
fi

npx ts-node vigenere.ts "$1" "$2" "$3"
