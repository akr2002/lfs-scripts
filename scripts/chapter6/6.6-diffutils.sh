#!/bin/bash

cd $LFS/sources
tar xf diffutils-3.8.tar.xz
cd diffutils-3.8

./configure --prefix=/usr --host=$LFS_TGT

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make DESTDIR=$LFS install

cd $LFS/sources
rm -rf diffutils-3.8

