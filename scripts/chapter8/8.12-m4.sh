#!/bin/bash

cd /sources
tar xf m4-1.4.19.tar.xz
cd m4-1.4.19

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
rm -rf m4-1.4.19

