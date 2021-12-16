#!/bin/bash

###Enter your sip credentials here###

SIPID=
SIPPASSWORD=

#####################################

FILE=$(pwd)/pjsua-unpacked/pjsip-apps/bin
#echo $FILE
if [ ! -d "$FILE" ]; then
echo "Downloading & Unpacking..."
wget https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz -O pjsua-archive.tar.gz
mkdir pjsua-unpacked
tar -xzvf pjsua-archive.tar.gz --strip 1 -C pjsua-unpacked

echo "Configuring and Building..."
cd pjsua-unpacked
./configure
make dep && make clean && make
else
echo "pjsua is already installed"
fi
cd pjsua-unpacked
cd pjsip-apps/bin
./pjsua-*