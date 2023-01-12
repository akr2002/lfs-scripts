#!/bin/bash

cd /sources
tar xf groff-1.22.4.tar.gz
cd groff-1.22.4

PAGE=A4 ./configure --prefix=/usr

if [ $? -ne 0 ]
then
  exit 1
fi

make -j1

if [ $? -ne 0 ]
then
  exit 1
fi

make install

cd /sources
rm -rf groff-1.22.4
