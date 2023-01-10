#!/bin/bash

cd /sources
tar xf readline-8.1.2.tar.gz
cd readline-8.1.2

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1.2

if [ $? -ne 0 ]
then
  exit 1
fi

make SHLIB_LIBS="-lncursesw" -j5

if [ $? -ne 0 ]
then
  exit 1
fi 

make SHLIB_LIBS="-lncursesw" install

install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1.2

cd /sources
rm -rf readline-8.1.2

