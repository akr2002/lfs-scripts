#!/bin/bash

cd /sources
tar xf eudev-3.2.11.tar.gz
cd eudev-3.2.11

./configure --prefix=/usr           \
            --bindir=/usr/sbin      \
            --sysconfdir=/etc       \
            --enable-manpages       \
            --disable-static

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

mkdir -pv /usr/lib/udev/rules.d
mkdir -pv /etc/udev/rules.d

make check

make install

tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install

udevadm hwdb --update

cd /sources
rm -rf eudev-3.2.11
