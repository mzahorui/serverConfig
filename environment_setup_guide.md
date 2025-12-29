ssh-add ~/.ssh/github_ed25519

ansible-galaxy collection install community.general
ansible-playbook -i inventory.ini setup.yaml -k -K

# Forward Host Port 2222 -> Guest Port 22
virsh --connect qemu:///session qemu-monitor-command debian-server --hmp "hostfwd_add tcp::2222-:22"

virsh --connect qemu:///session destroy debian-server
virsh --connect qemu:///session undefine debian-server
