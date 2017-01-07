# Small Shell Scripts

This repo is a collection of several scripts I have written.

##extract.sh

A script that allows you to extract the contents from multiple types of archives without specifying flags or memorizing syntax. 

Supports the following formats but can easily be expanded:

* .zip  
* .rar  
* .7z  
* .tar  
* .tar.gz 


##ip.sh

Periodically checks your external IP Address to see if it has changed and logs the information. Useful for DDNS.

##moveimage.sh

This script was written while I was recovering thousands of photos from a Macbook that my friend accidently deleted. TestDisk returned hundreds of thousands of files and I found the results too daunting to parse through manually. Thumbnails and scaled images were included in the results so I wrote this script to sort everything into different folders depending on an images resolution and/or size for easier recovery.

##sysinfo.sh

Queries MacOS for some system information. Example output:

```
tj@earth > ./sysinfo.sh

———————-System Information:———————

CPU: 5.55%
MEM: 7.83GB
HDD: 65 GB
TMP: 50.0°C
FAN: 1297.0 RPM
IPA: 10.66.2.63
UPL: 29.48 KB/s
DWN: 666.62 KB/s
UPT: 0 Days 1 Hours 35 Minutes


—————————Top Processes:—-————————-

COMMAND            PID  %CPU %MEM
accountsd          311  51.7  0.1
CalendarAgent      269  16.9  0.6
securityd           78   6.0  0.1
iTerm2           40374   4.2  0.5
syslogd             38   4.0  0.0
WindowServer       159   2.3  0.8
notifyd             98   2.1  0.0
secd               245   1.6  0.1
distnoted          220   1.2  0.1
opendirectoryd      72   1.2  0.2
```

##weather.sh

weather.sh is a script used to query a weather program, weather-report, for the forecast for the locaton of the server.
