#!/bin/bash

cd /sources
tar xf expat-2.4.8.tar.xz
cd expat-2.4.8

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.8

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

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.8

cd /sources
rm -rf expat-2.4.8
