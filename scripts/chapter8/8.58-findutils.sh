#!/bin/bash

cd /sources
tar xf findutils-4.9.0.tar.xz
cd findutils-4.9.0

case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

chown -Rv tester .
su tester -c "PATH=$PATH make check"

make install

cd /sources
rm -rf findutils-4.9.0
