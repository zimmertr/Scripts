nmtui

systemctl stop rsyslog && systemctl stop auditd 
sed -i ‘/^(HWADDR|UUID)=/d’ /etc/sysconfig/network-scripts/ifcfg-eno16780032

yum clean all 
logrotate -f /etc/logrotate.conf 
cat /dev/null > /var/log/audit/audit.log 
cat /dev/null > /var/log/wtmp 
cat /dev/null > /var/log/lastlog 
cat /dev/null > /var/log/grubby 

vim /etc/sysconfig/network-scripts/ifcfg-e*

rm -rf /tmp/* 
rm -rf /var/tmp/* 
rm -f ~root/.bash_history 

unset HISTFILE 

rm -rf ~root/.ssh/
rm -f ~root/anaconda-ks.cfg 
rm -f /home/tj/anaconda-ks.cfg 
rm -f /home/tj/.zsh_history 
rm -f /home/tj/.bash_history 
rm /root/.zsh_history 

shutdown
