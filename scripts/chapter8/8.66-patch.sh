#!/bin/bash

cd /sources
tar xf patch-2.7.6.tar.xz
cd patch-2.7.6

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
rm -rf patch-2.7.6
