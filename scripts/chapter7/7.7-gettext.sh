#!/bin/bash

cd /sources
tar xf gettext-0.21.tar.xz
cd gettext-0.21

./configure --disable-shared

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then
  exit 1
fi

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

cd $LFS/sources
rm -rf gettext-0.21

