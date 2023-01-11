#!/bin/bash

cd /sources
tar xf bison-3.8.2.tar.xz
cd bison-3.8.2

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2

if [ $? -ne 0 ]
then
  exit 1
fi

make check

make install

cd /sources
rm -rf bison-3.8.2
