#!/bin/bash

cd /sources
tar xf gzip-1.12.tar.xz
cd gzip-1.12

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
rm -rf gzip-1.12
