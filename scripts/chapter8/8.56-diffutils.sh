#!/bin/bash

cd /sources
tar xf diffutils-3.8.tar.xz
cd diffutils-3.8

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
rm -rf diffutils-3.8
