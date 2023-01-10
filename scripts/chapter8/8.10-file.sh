#!/bin/bash

cd /sources
tar xf file-5.42.tar.gz
cd file-5.42

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
rm -rf file-5.42

