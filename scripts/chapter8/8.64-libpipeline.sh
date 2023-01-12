#!/bin/bash

cd /sources
tar xf libpipeline-1.5.6.tar.gz
cd libpipeline-1.5.6

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
rm -rf libpipeline-1.5.6
