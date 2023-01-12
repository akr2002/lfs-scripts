#!/bin/bash

cd /sources
tar xf XML-Parser-2.46.tar.gz
cd XML-Parser-2.46

perl Makefile.PL

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

make install

cd /sources
rm -rf XML-Parser-2.46
