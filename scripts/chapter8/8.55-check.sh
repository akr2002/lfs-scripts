#!/bin/bash

cd /sources
tar xf check-0.15.2.tar.gz
cd check-0.15.2

./configure --prefix=/usr --disable-static

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

make docdir=/usr/share/doc/check-0.15.2 install

cd /sources
rm -rf check-0.15.2
