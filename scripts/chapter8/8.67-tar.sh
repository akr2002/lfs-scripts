#!/bin/bash

cd /sources
tar xf tar-1.34.tar.xz
cd tar-1.34

FORCE_UNSAFE_CONFIGURE=1  \
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
make -C doc install-html docdir=/usr/share/doc/tar-1.34
