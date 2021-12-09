# auto-answer-calls

## Dependencies:
The following packages must be installed:
`sudo apt install python-dev gcc make gcc binutils build-essential`.  Also, to detect an audio resource, the following must be installed: `sudo apt-get install libasound2-dev`.

## Installation:
1. [download PJSUA.tar.gz](https://www.pjsip.org/download.htm)
2. unpack the file: `tar -xzvf pjproject-<version>.tar.gz`
3. switch to the folder `cd pjproject-<version>`
4. run configure script: `./configure`
5. build project: `make dep && make clean && make`
6. add symbolic link in ~/.local/bin or anything else in $PATH (`echo $PATH`)) to pjsua-binary: `ln -s ~/<entpackter pjsip root ordner>/pjsip-apps/bin/pjsua-x86_64-unknown-linux-gnu ~/.local/bin/pjsua`<br>
**Attention: Relative paths do not work here! && Caution Mac User: The file is named differently, so path could look like this: <br> `~/<unpacked pjsip root folder>/pjsip-apps/bin/pjsua-x86_64-apple-darwin20.4.0`**
7. PJSUA can now be used everywhere: `pjsua`

## Accept call automatically & initiate via REST API
1. Get data: We need SIP ID, SIP password and registrar. <br>
1.1 In visual routing you can select a device at the top and find the data there.<br>
1.2 The SIP URL for our devices is built up as follows: sip:<SIP-ID>@sipgate.de
2. Start Pjsua with the following command (terms in angle brackets must be replaced): pjsua --registrar=sip:sipgate.de --id=<SIP-URL> --realm="*" --username=<SIP-ID> --password=<sip-password> --auto-answer=200
3. Now a new call can be started via the endpoint /sessions/calls. The call will be automatically accepted by Pjsua.


