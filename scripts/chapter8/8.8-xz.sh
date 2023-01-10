#!/bin/bash

cd /sources
tar xf xz-5.2.6.tar.xz
cd xz-5.2.6

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.6

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

cd /sources
rm -rf xz-5.2.6

