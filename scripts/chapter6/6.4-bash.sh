#!/bin/bash

cd $LFS/sources
tar xf bash-5.1.16.tar.gz
cd bash-5.1.16

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

if [ $? -ne 0 ]
then
  exit 1
fi

make -j5

if [ $? -ne 0 ]
then 
  exit 1
fi

make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh

cd $LFS/sources
rm -rf bash-5.1.16
