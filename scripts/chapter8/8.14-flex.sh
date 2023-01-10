#!/bin/bash

cd /sources
tar xf flex-2.6.4.tar.gz
flex-2.6.4

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

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

ln -sv flex /usr/bin/lex

cd /sources
rm -rf flex-2.6.4

