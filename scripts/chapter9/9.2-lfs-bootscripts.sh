#!/bin/bash

cd /sources
tar xf lfs-bootscripts-20220723.tar.xz
cd lfs-bootscripts-20220723

make install

cd /sources
rm -rf lfs-bootscripts-20220723
