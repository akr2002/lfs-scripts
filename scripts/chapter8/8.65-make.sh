#!/bin/bash

cd /sources
tar xf make-4.3.tar.gz
cd make-4.3

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
rm -rf make-4.3
