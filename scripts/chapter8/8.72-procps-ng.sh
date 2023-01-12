#!/bin/bash

cd /sources
tar xf procps-ng-4.0.0.tar.xz
cd procps-ng-4.0.0

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-4.0.0 \
            --disable-static                         \
            --disable-kill

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make check

make install

cd /sources
rm -rf procps-ng-4.0.0
