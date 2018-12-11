#!/bin/bash

apt-get install ssh -y >> script.log
apt-get install vim -y >> script.log
apt-get install apache2 -y >> script.log
apt-get install iptables -y >> script.log
apt-get install iptables-presistent -y >> script.log
apt-get install fail2ban -y >> script.log
apt-get install postfix -y >> script.log
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
