#!/bin/bash

cd /sources
tar xf grep-3.7.tar.xz
cd grep-3.7

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
rm -rf grep-3.7
