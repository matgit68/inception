#!/bin/sh
# This script allows you to generate and store a password automatically or
# read user input and store it in a file, depending on the arguments provided.
# arguments MUST be in that order : $1 file $2. option

if [ -z "$1" ]; then
    echo "Usage: pass <file> [--auto]"
    echo "Write input into file"
    exit 1
fi

if [ "$2" = "--auto" ]; then
    openssl rand -base64 12 > "$1"
else
    read -s input
    echo "$input" > "$1"
fi
