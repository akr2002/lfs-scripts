#!/bin/bash

cd /sources
tar xf zlib-1.2.12.tar.xz
cd zlib-1.2.12

./configure --prefix=/usr

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

rm -fv /usr/lib/libz.a

cd /sources
rm -rf zlib-1.2.12

