#!/bin/bash

cd /sources
tar xf sysvinit-3.04.tar.xz
cd sysvinit-3.04

patch -Np1 -i ../sysvinit-3.04-consolidated-1.patch

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

make install

cd /sources
rm -rf sysvinit-3.04
