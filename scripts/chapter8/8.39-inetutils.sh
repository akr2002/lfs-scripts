#!/bin/bash

cd /sources
tar xf inetutils-2.3.tar.xz
cd inetutils-2.3

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make check

make install

mv -v /usr/{,s}bin/ifconfig

cd /sources
rm -rf inetutils-2.3
