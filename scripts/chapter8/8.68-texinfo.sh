#!/bin/bash

cd /sources
tar xf texinfo-6.8.tar.xz
cd texinfo-6.8

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

make TEXMF=/usr/share/texmf install-tex

cd /sources
rm -rf texinfo-6.8
