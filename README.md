# auto-answer-click2dial
This tutorial shows how to automatically answer calls initiated by sipgate.io using [pjsua](https://www.pjsip.org/pjsua.htm).<br>
(tested on Ubuntu und MacOS)

## Automatic installation and test (using a bash script)
1. The following packages must be installed:<br>
`sudo apt install python-dev gcc make gcc binutils build-essential libasound2-dev`
2. Clone/download this repository
3. Get data: We need the `SIP-ID` and `SIP-password`. <br>
3.1 In the [visual routing](https://app.sipgate.com/routing) you can select a device at the top and find the data there.<br>
4. (Optional) If you want to test the automatical pickup right away, you will need some more data to make the right API call:<br>
4.1 `TOKENID` and `TOKEN` can be created following [these instructions](https://www.sipgate.io/rest-api/authentication)<br>
4.2 The `DEVICEEXTENSION` is the suffix of the `SIP-ID` including the letter (eg: `e12`)<br>
4.3 The `CALLEE` is the number you want to call (eg: `+49211123456789`) <br>
4.4 The `CALLERID` is the number shown on the callees display
5. Insert the data at the top of the `pjsua-setup.sh` scipt
6. Start the script using `bash pjsua-setup.sh`
<br>
The first time this script is executed it will download, build and setup pjsua automatically and start a call. This might take a while. The following executions will skip the download and build, and start the call right away. If you don't want the script to start a call just comment out the last 4 lines.

## Manual installation 
### Installation:
1. the following packages must be installed:<br>
`sudo apt install python-dev gcc make gcc binutils build-essential libasound2-dev`
2. [download pjproject.tar.gz](https://www.pjsip.org/download.htm)
3. unpack the file: `tar -xzvf pjproject-<version>.tar.gz`
4. switch to the folder `cd pjproject-<version>`
5. run configure script: `./configure`
6. build project: `make dep && make clean && make && make install`
7. choose a directory, listed by `echo $PATH` (from now on called PATHDIR)
8. add symbolic link in PATHDIR to pjsua-binary:<br>
 `ln -s /<absolute path to unpacked pjsua>/pjsip-apps/bin/pjsua-x86_64-unknown-linux-gnu <PATHDIR>/pjsua`<br>
**Attention: Relative paths do not work here! <br>
Caution Mac User: The file is named differently, so path could look like this:** <br> `/<absolute path to unpacked pjsua>/pjsip-apps/bin/pjsua-x86_64-apple-darwin20.4.0`
9. pjsua can now be used everywhere: `pjsua`

### Accept call automatically & initiate via REST API
1. Get data: We need the `SIP-ID` and `SIP-password`. <br>
1.1 In the [visual routing](https://app.sipgate.com/routing) you can select a device at the top and find the data there.<br>
1.2 The SIP URL for our devices is built up as followed: `sip:<SIP-ID>@sipgate.de`
2. Start pjsua with the following command (terms in angle brackets must be replaced): `pjsua --registrar=sip:sipgate.de --id=<SIP-URL> --realm="*" --username=<SIP-ID> --password=<SIP-password> --auto-answer=200`
3. Now a new call can be started via the endpoint `/sessions/calls`. The call will be automatically accepted by pjsua.<br>
3.1 You can use our [node-example](https://github.com/sipgate-io/sipgateio-node-examples/#performing-a-call) to initiate a call using our node-library  

