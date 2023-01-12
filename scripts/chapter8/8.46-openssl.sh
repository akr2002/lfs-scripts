#!/bin/bash

cd /sources
tar xf openssl-3.0.5.tar.gz
cd openssl-3.0.5

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make test

make test

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.5

cp -vfr doc/* /usr/share/doc/openssl-3.0.5

cd /sources
rm -rf openssl-3.0.5
