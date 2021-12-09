# auto-answer-calls

## Dependencies:
The following packages must be installed:
`sudo apt install python-dev gcc make gcc binutils build-essential`.  Also, to detect an audio resource, the following must be installed: `sudo apt-get install libasound2-dev`.

## Installation:
1. [download PJSUA.tar.gz](https://www.pjsip.org/download.htm)
2. unpack the file: `tar -xzvf pjproject-<version>.tar.gz`
3. switch to the folder `cd pjproject-<version>`
4. run configure script: `./configure`
5. build project: `make dep && make clean && make && make install`
6. choose a directory, listed by `echo $PATH` (from now on called PATHDIR)
7. add symbolic link in PATHDIR to pjsua-binary: `ln -s /<absolute path to unpacked pjsua>/pjsip-apps/bin/pjsua-x86_64-unknown-linux-gnu <PATHDIR>/pjsua`<br>
**Attention: Relative paths do not work here! && Caution Mac User: The file is named differently, so path could look like this: <br> `/<absolute path to unpacked pjsua>/pjsip-apps/bin/pjsua-x86_64-apple-darwin20.4.0`**
8. PJSUA can now be used everywhere: `pjsua`

## Accept call automatically & initiate via REST API
1. Get data: We need SIP ID, SIP password and registrar. <br>
1.1 In the [visual routing](https://app.sipgate.com/routing) you can select a device at the top and find the data there.<br>
1.2 The SIP URL for our devices is built up as followed: `sip:<SIP-ID>@sipgate.de`
2. Start Pjsua with the following command (terms in angle brackets must be replaced): `pjsua --registrar=sip:sipgate.de --id=<SIP-URL> --realm="*" --username=<SIP-ID> --password=<SIP-password> --auto-answer=200`
3. Now a new call can be started via the endpoint `/sessions/calls`. The call will be automatically accepted by Pjsua.

~~~json
{
  "deviceId": "<e with the following numbers of the sip-id>",
  "caller": "<e with the following numbers of the sip-id>",
  "callee": "<call recipients phone number>",
  "callerId": "<number shown on recipients device>"
}
Example:
{
  "deviceId": "e14",
  "caller": "e14",
  "callee": "+4912345678900",
  "callerId": "+4900987654321"
}
  
~~~

