#!/bin/bash

cd /sources
tar xf acl-2.3.1.tar.xz
cd acl-2.3.1

./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1

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

cd /sources
rm -rf acl-2.3.1

