#!/bin/bash

cd $LFS/sources
tar xf gzip-1.12.tar.xz
cd gzip-1.12

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
rm -rf gzip-1.12

