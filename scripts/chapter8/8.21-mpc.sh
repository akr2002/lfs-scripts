#!/bin/bash

cd /sources
tar xf mpc-1.2.1.tar.gz
cd mpc-1.2.1

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make hmtl

make check

make install
make install-html

cd /sources
rm -rf mpc-1.2.1

