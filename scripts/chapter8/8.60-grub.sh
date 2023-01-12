#!/bin/bash

cd /sources
tar xf grub-2.06.tar.xz
cd grub-2.06

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completi

cd /sources
rm -rf grub-2.06
