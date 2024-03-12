#!/bin/bash

cwd="$(dirname "$(readlink -f "$0")")"
host_name=$(<"$cwd/../data/host_name")
local_user=$(<"$cwd/../data/local_user")
remote_user=$(<"$cwd/../data/remote_user")
remote_ip=$(<"$cwd/../data/remote_ip")

bash "$cwd/ssh_key_gen.sh"

#TODO: check if remote is running before copying
ssh-copy-id -i "$HOME/.ssh/$host_name" "$local_user@$remote_ip"

#ssh -i ~/.ssh/homelab mechanical_turk@192.168.64.5 # Sample ssh connection command