#!/bin/bash

# One liner :P
# find "$1" -printf '%d %y %p\n' | sed 's,^\([0-9]*\) d,\1 Directory,;s,^\([0-9]*\) [^D],\1 File,;s,^\([0-9]*\) \([^ ]*\) \(.*\),printf "%*c %s: %s\\n" "\1" " " "\2" "\3",' | bash



function tree () {
	local FILE="$1"
	local SPACES="$2"
	if [ "$SPACES" != "0" ]; then # fix SPACES=0 still printing spaces
		# print SPACES*4 spaces
		printf "%*c" "$SPACES" " " # prints spaces  (%*c prints the character " " with width of $SPACES)
		printf "%*c" "$SPACES" " " # prints spaces  (%*c prints the character " " with width of $SPACES)
		printf "%*c" "$SPACES" " " # prints spaces  (%*c prints the character " " with width of $SPACES)
		printf "%*c" "$SPACES" " " # prints spaces  (%*c prints the character " " with width of $SPACES)
	fi
	if [ ! -d "$FILE" ]; then 
		# FILE is not a directory
		printf "File: %s \n" "$FILE"
	else
		# FILE is a directory
		printf "Directory: %s \n" "$FILE" 
		#find "$FILE" -maxdepth 1 -mindepth 1 | while read LINE; do
		find "$FILE" -maxdepth 1 -mindepth 1 -printf "%y %p\n" | sort -r | cut -d " " -f 2- | while read LINE; do # sort by file type (looks better)
			tree "$LINE" "$(( SPACES + 1 ))" # recursive call
		done
	fi
}  
tree "$1" 0 # initial call
