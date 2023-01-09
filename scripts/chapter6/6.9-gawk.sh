#!/bin/bash

cd $LFS/sources
tar xf gawk-5.1.1.tar.xz
cd gawk-5.1.1

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

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
rm -rf gawk-5.1.1

