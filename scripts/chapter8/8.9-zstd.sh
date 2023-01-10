#!/bin/bash

cd /sources
tar xf zstd-1.5.2.tar.gz
cd zstd-1.5.2

patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch

make -j5 prefix=/usr

if [ $? -ne 0 ]
then
  exit 1
fi

make check

make prefix=/usr install

rm -v /usr/lib/libzstd.a

cd /sources
rm -rf zstd-1.5.2

