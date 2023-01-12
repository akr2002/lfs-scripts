#!/bin/bash

cd /sources
tar xf less-590.tar.gz
cd less-590

./configure --prefix=/usr --sysconfdir=/etc

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
rm -rf less-590
