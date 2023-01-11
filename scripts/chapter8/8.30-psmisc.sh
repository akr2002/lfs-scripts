#!/bin/bash

cd /sources
tar xf psmisc-23.5.tar.xz
cd psmisc-23.5

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

make install

cd /sources
rm -rf psmisc-23.5
