#!/bin/bash

cd $LFS/sources
tar xf file-5.42.tar.gz
cd file-5.42

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib

  if [ $? -ne 0 ]
  then
    exit 1
  fi

  make

  if [ $? -ne 0 ]
  then
    exit 1
  fi

popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

if [ $? -ne 0 ]
then
  exit 1
fi

make FILE_COMPILE=$(pwd)/build/src/file

if [ $? -ne 0 ]
then
  exit 1
fi

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/libmagic.la

cd $LFS/sources
rm -rf file-5.42

