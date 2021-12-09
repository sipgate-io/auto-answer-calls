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

## Start PJSUA with created account. (Method 1 #recommended)
Since created accounts and buddies always disappear when you close PJSUA you can add them directly at startup with this command.
1. Get data: We need SIP ID, SIP password and registrar.<br>
1.1. In the [Visual-Routing](https://app.sipgate.com/w0/routing) you can select a device at the top and find the data there. <br>
1.2. The SIP URL for our devices is built like this: `sip:<SIP-ID>@sipgate.de`
2. enter data: `pjsua --registrar=sip:sipgate.de --id=<SIP-URL> --realm="*" --username=<SIP-ID> --password=<sip-password> --add-buddy <buddy-sip-URI>`
3. For automatic call answering append : `--auto-answer=200`

## Create own device: (method 2 #manual)
1. Get data: We need SIP-ID, SIP-Password and Registrar.<br>
1.1. In the [Visual-Routing](https://app.sipgate.com/w0/routing) you can choose a device at the top and find the data there.
2. Start PJSUA: `pjsua`
3. Add new account: `+a`
4. SIP-URL: `sip:<SIP-ID>@sipgate.de`
5. registrar: `sip:sipgate.de`
6. Auth realm: `*`
7. Auth username: `<SIP-ID>`
8. Auth password: `<SIP-Passwort>`
9. The device should now be available for PJSUA

## Making calls:
1. After adding your own device, add other devices to your buddy list: `+b`, then `Enter buddy's URI: sip:<SIP-ID>@sipgate.de`.  You need to add the SIP URLs you want to call to your list, otherwise no call will be made. The person being called does not have to have you in the buddy list.
2. With the command `m` you can start a new call. Then you choose the device of your choice.
3. The person answering the call must do the command `a` in ihrer in their console and then return the code `200` to successfully answer the call.
4. With the command `h` both parties can stop the call
