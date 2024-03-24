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
	trap - EXIT
}

## Gather dependencies
# brew install qemu

## Choose name for VM
# printf "Enter name for VM [ENTER for vm]:"
# read input
vm_name="${input:-"vm"}"

## Create Image
# printf "Enter disk size in GB [ENTER for 8]:"
# read input
disk_size="${input:-8}"

# Creation of disk file
format="qcow2"
qemu-img create -f $format $vm_name.$format $disk_size

# boot machine
# printf "Enter the path to .iso:"
# read iso_path
iso_path=/Users/petermousses/Downloads/archlinux-2024.03.01-x86_64.iso
qemu-system-x86_64 \
	$vm_name.$format \
    -machine type=q35 \
    -smp 2 \
    -cdrom $iso_path \
    -m 2G \
    -vga virtio \
    -usb \
    -device usb-tablet \
	-monitor stdio \
    -display default

# Set up basic SSH on VM
enter_key="0x1c"
printf "Wait for VM to reach bootloader then press [ENTER]"
echo "$enter_key"

# Gather remote commands
file_name="setup_ssh_in_arch_vm.sh"
lines=()
while IFS= read -r line; do
    lines+=("$line")
done < "$file_name"

# Execute remote commands
for line in "${lines[@]}"; do
    eval $(echo "$line")
done