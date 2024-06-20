#!/bin/sh
if [ ! $1 ]; then
	echo "Usage: pass <file>"
	echo "Write input into file"
	return 1
fi
echo "Enter pasword"
read -s password;
echo $password > $1
