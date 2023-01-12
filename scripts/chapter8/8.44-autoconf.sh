#!/bin/bash

cd /sources
tar xf autoconf-2.71.tar.xz
cd autoconf-2.71

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

cd /sources
rm -rf autoconf-2.71
