#!/bin/bash

display_progress () {
	#TODO: fix
	# Usage: 
	#	<command> & pid=$!
	#	display_progress $pid <args>
	#	unset pid
	return
	trap "kill $1 2> /dev/null" EXIT
	msg="${2:-""}"
	incrementer=0
	progress_length="${3:-2}"
	char1="${4:-"-"}"
	char2="${5:-"*"}"
	while kill -0 $1 2> /dev/null; do
		remainder=$(($incrementer%$progress_length))
		printf "\r${msg}("
		eval $(echo printf -- '"${char1}%0.s"' {0..$incrementer})
		printf "${char2}"
		eval $(echo printf -- '"${char1}%0.s"' {0..$(($progress_length-$incrementer))})
		printf ")"
		sleep 0.25
		incrementer=$(($incrementer+1))
	done
	printf "\n"
}

## Gather dependencies
# brew install qemu

## Choose name for VM

## Create Image
printf "Enter disk size in GB [ENTER for 8]:"
read input
disk_size="${input:-8}"
unset input

# Creation of disk file


## Disable all traps
trap - EXIT