#!/bin/bash

cd /sources
tar xf mpfr-4.1.0.tar.xz
cd mpfr-4.1.0

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make html

make check

make install
make install-html

cd /sources
rm -rf mpfr-4.1.0

