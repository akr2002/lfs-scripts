#!/bin/bash

cd /sources
tar xf linux-5.19.2.tar.xz
cd linux-5.19.2

make mrproper

make menuconfig

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make modules_install

cp -iv System.map /boot/System.map-5.19.2
cp -iv .config /boot/config-5.19.2

install -d /usr/share/doc/linux-5.19.2
cp -r Documentation/* /usr/share/doc/linux-5.19.2

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

cd /sources
rm -rf linux-5.19.2
