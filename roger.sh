#!/bin/bash

apt-get install ssh -y
apt-get install vim -y
apt-get install apache2 -y
apt-get install iptables -y
apt-get install iptables-persistent -y
service iptables-persistent start
apt-get install fail2ban -y
apt-get install postfix -y
cp src/jail.local /etc/fail2ban/ >> script.log
cat src/rules.v4 > /etc/iptables/rules.v4
cp src/sasl_passwd /etc/postfix/sasl/ >> script.log
postmap /etc/postfix/sasl/sasl_passwd >> script.log
chown root:root /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db >> script.log
chmod 0600 /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db >> script.log
cat src/main.cf > /etc/postfix/main.cf
cat src/sshd_config > /etc/ssh/sshd_config
cat src/aliases > /etc/aliases script.log
cat src/interfaces > /etc/network/interfaces
service postfix restart >> script.log
service apache2 restart >> script.log
service fail2ban restart >> script.log
service ssh restart >> script.log
fail2ban-client reload >> script.log
reboot
