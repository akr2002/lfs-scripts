#!/bin/bash

cd $LFS/sources
tar xf Python-3.10.6.tar.xz
cd Python-3.10.6

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

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

cd $LFS/sources
rm -rf Python-3.10.6

