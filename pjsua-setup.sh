#!/bin/bash

###Enter your sip credentials here###

export SIPID=
export SIPPASSWORD=
TOKEN=
TOKENID=
DEVICEEXTENSION=
CALLEE=
CALLERID=

#####################################

FILE=$(pwd)/pjsua-unpacked/pjsip-apps/bin
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
gnome-terminal  -- bash -c './pjsua-* --registrar=sip:sipgate.de --id=sip:${SIPID}@sipgate.de --realm="*" --username=$SIPID --password=$SIPPASSWORD --auto-answer=200'

# Initiate Call via Post Request
curl --location --request POST 'https://api.sipgate.com/v2/sessions/calls' \
--header 'Content-Type: application/json' \
--user "$TOKENID:$TOKEN" \
--data-raw "{\"deviceId\": \"$DEVICEEXTENSION\", \"caller\": \"$DEVICEEXTENSION\", \"callee\": \"$CALLEE\", \"callerId\": \"$CALLERID\"}"