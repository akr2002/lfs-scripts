#!/bin/bash

cd $LFS/sources
tar xf sed-4.8.tar.xz
cd sed-4.8

./configure --prefix=/usr   \
            --host=$LFS_TGT

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
rm -rf sed-4.8

