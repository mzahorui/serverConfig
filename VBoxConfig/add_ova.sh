#!/bin/bash
USER=$(whoami)
SOURCE="$HOME/Downloads/vbox-debian.ova"
DEST="/goinfre/$USER/vbox-debian.ova"
VM_NAME="debian-server"

# 1) Copy OVA to /goinfre/$USER
cp -f "$SOURCE" "$DEST"

# 2) Import OVA and specify basefolder
VBoxManage import "$DEST" --vsys 0 --vmname "$VM_NAME" --basefolder "/goinfre/$USER"

# 3) Set up port forwarding: host 2424 -> guest 22
VBoxManage modifyvm "$VM_NAME" --natpf1 "ssh,tcp,,2424,,22"

# 4) Start VM headless
VBoxManage startvm "$VM_NAME" --type headless

echo "VM $VM_NAME is running. Connect via: ssh -p 2424 user@localhost"
