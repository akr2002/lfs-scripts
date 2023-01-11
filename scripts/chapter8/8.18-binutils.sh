#!/bin/bash

cd /sources
tar xf binutils-2.39.tar.xz
cd binutils-2.39

expect -c "spawn ls"

mkdir -v build
cd       build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

if [ $? -ne 0 ]
then
  exit 1
fi

make tooldir=/usr -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make -k check

make tooldir=/usr install

rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a

cd /sources
rm -rf binutils-2.39

