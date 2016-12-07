#! /bin/bash
###############################################################
###############################################################
##ip.sh is a script used to record the IP changes that occur ##
##while using noip.net's DDNS.                               ##
###############################################################
###############################################################
echo -ne "<br>$(date) - $(wget http://ipinfo.io/ip -qO -)" >> /media/NetDrive/Website/iphistory.html
echo "" >> /media/NetDrive/Website/iphistory.html
echo "" >> /media/NetDrive/Website/iphistory.html
