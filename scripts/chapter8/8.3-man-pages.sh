#!/bin/bash

cd /sources
tar xf man-pages-5.13.tar.xz
cd man-pages-5.13

make prefix=/usr install

if [ $? -ne 0 ]
then
  exit 1
fi

cd /sources
rm -rf man-pages-5.13

