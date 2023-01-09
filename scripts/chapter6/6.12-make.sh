#!/bin/sh

cd $LFS/sources
tar xf make-4.3.tar.gz
cd make-4.3

./configure --prefix=/usr   \
            --without-guile \
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
rm -rf make-4.3

