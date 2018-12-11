#!/bin/bash

apt-get install ssh -y
apt-get install vim -y
apt-get install apache2 -y
apt-get install iptables -y
apt-get install iptables-persistent -y
apt-get install fail2ban -y
apt-get install postfix -y
cp /src/jail.local /etc/fail2ban/
cat /src/rules.v4 > /etc/iptables/rules.v4
cp /src/sasl_passwd /etc/postfix/sasl/
postmap /etc/postfix/sasl/sasl_passwd
chown root:root /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db
chmod 0600 /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db
cat /src/main.cf > /etc/postfix/main.cf
cat /src/sshd_config > /etc/ssh/sshd_config
cat /src/aliases > /etc/aliases
ip link set enp0s3 down
cat /src/interfaces > /etc/network/interfaces
ip link set enp0s3 up
service postfix restart
service apache2 restart
service fail2ban restart
service ssh restart
fail2ban-client reload
reboot
