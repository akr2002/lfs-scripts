#!/bin/bash

cd /sources
tar xf bc-6.0.1.tar.xz
cd bc-6.0.1

CC=gcc ./configure --prefix=/usr -G -O3 -r

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
rm -rf bc-6.0.1

