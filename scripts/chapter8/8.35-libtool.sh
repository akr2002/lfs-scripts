#!/bin/bash

cd /sources
tar xf libtool-2.4.7.tar.xz
cd libtool-2.4.7

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

rm -fv /usr/lib/libltdl.a

cd /sources
rm -rf libtool-2.4.7
