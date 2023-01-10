#1/bin/bash

cd /sources
tar xf iana-etc-20220812.tar.gz
cd iana-etc-20220812

cp services protocols /etc

cd /sources
rm -rf iana-etc-20220812

