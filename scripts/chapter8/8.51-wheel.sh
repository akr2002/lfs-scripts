#!/bin/bash

cd /sources
tar xf Python-3.10.6.tar.xz
cd Python-3.10.6

pip3 install --no-index $PWD

cd /sources
rm -rf Python-3.10.6
