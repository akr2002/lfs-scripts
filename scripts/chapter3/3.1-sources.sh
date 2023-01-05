#!/bin/bash

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

cd $LFS/sources
wget -c https://linuxfromscratch.org/lfs/view/stable/wget-list-sysv
wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
wget -c https://linuxfromscratch.org/lfs/view/stable/md5sums
wget -c https://www.zlib.net/zlib-1.2.13.tar.gz --directory-prefix=$LFS/sources

pushd $LFS/sources
md5sum -c md5sums
popd
