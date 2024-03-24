#!/bin/bash
systemctl enable sshd
passwd

# Note: This final line is necessary for the way that the file is read in create_vm_macos.sh