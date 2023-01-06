#!/bin/bash

cd $LFS/sources
tar xf binutils-2.39.tar.xz 
cd $LFS/sources/binutils-2.39

mkdir -v build
cd build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror

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

