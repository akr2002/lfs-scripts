#!/bin/bash

cd /sources
tar xf libcap-2.65.tar.xz
cd libcap-2.65

sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib

if [ $? -ne 0 ]
then
  exit 1
fi

make test

make prefix=/usr lib=lib install

cd /sources
rm -rf libcap-2.65

