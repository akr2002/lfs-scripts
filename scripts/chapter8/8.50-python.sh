#!/bin/bash

cd /sources
tar xf Python-3.10.6.tar.xz
cd Python-3.10.6

./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --with-system-ffi    \
            --enable-optimizations

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

cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

install -v -dm755 /usr/share/doc/python-3.10.6/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.10.6/html \
    -xvf ../python-3.10.6-docs-html.tar.bz2

cd /sources
rm -rf Python-3.10.6
