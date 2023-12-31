#!/bin/bash

# Exit this line
# grub-install /dev/sda

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 5.19.2-lfs-11.2" {
        linux   /boot/vmlinuz-5.19.2-lfs-11.2 root=/dev/sda2 ro
}
EOF

