#!/bin/bash
echo && echo ———————-System Information:——————— && echo

#Find time since last boot.
then=$(sysctl kern.boottime | awk '{print $5}' | sed "s/,//")
now=$(date +%s)
diff=$(($now-$then))

#Convert time to human readable stuff.
days=$(($diff/86400));
diff=$(($diff-($days*86400)))
hours=$(($diff/3600))
diff=$(($diff-($hours*3600)))
minutes=$(($diff/60))



#Find current bandwith in each pipe
myvar1=`netstat -bI en0 | awk "/en0/"'{print $7;exit}'` 
myvar3=`netstat -bI en0 | awk "/en0/"'{print $10;exit}'` 

sleep 1

#Find current bandwith in each pipe after a second.
myvar2=`netstat -bI en0 | awk "/en0/"'{print $7;exit}'` 
myvar4=`netstat -bI en0 | awk "/en0/"'{print $10;exit}'` 

#Find the difference between each pipe after 1 second. 
subin=$(($myvar2 - $myvar1))
subout=$(($myvar4 - $myvar3))

#Convert the bytes to kilobytes
kbin=`echo "scale=2; $subin/1024;" | bc`
kbout=`echo "scale=2; $subout/1024;" | bc`


#Current CPU usage
echo CPU: `top -l 1 | awk '/CPU usage/ {print $3}' | sed s/%//`%

#Current Memory Usage
usedMEM=`top -l 1 -s 0 | grep PhysMem | awk $'{print $2}' | awk $'{print $0}' | sed 's/M$//'` && usedMEM=`bc <<< "scale = 2; $usedMEM/1024"`
/bin/echo -n MEM: $usedMEM && /bin/echo GB

#Current Disk Usage
usedHDD=`df -h | grep -E "disk1" | awk '{print $3}' | sed 's/Gi$//'`
/bin/echo -n HDD: $usedHDD GB && echo

#Current CPU Temp
/bin/echo -n TMP: && istats | grep CPU\ temp | awk '{print $3}'

#Current Fan speed
/bin/echo -n FAN: && istats | grep Fan\ 0\ speed: | awk '{print $4,$5}'

#Current IP Address
/bin/echo -n IPA: && ipconfig getifaddr en0

#Current Network Traffic
echo "UPL: $kbout KB/s" 
echo "DWN: $kbin KB/s"

#Current uptime
echo UPT: $days Days $hours Hours $minutes Minutes


#Top 10 processes
echo && echo 
echo —————————Top Processes:—-————————- && echo
ps -arcwwwxo "command pid %cpu %mem" |  head -11