#!/bin/bash

cwd="$(dirname "$(readlink -f "$0")")"
ssh_email=$(<"$cwd/../data/email")
host_name=$(<"$cwd/../data/host_name")
key_file_destination="$HOME/.ssh/$host_name"
password=""

# Check if the SSH key already exists
if [ -f "$key_file_destination" ]; then
	echo "SSH key already exists at $key_file_destination"
	exit 1
fi

# Generate the SSH key
ssh-keygen -o -a 100 -t ed25519 -C "$ssh_email" -f "$key_file_destination" -N "$password"

# Check if the key generation was successful
if [ $? -eq 0 ]; then
	echo "SSH key generated successfully at $key_file_destination"
else
	echo "Failed to generate SSH key"
fi