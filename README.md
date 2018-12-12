# Roger SkyLine /16

Install vim, apache2, iptables, iptables-persistent, fail2ban, postfix

set static local ip address for your server.
configure your firewall (iptables) to protect your webserver from DOS attacks, ssh brute froce, ports scanning and accept only connections via ssh, http, https.
configure your ssh to accept only authentifications using RSA keys, and change the default port to 2222.
configure postfix to send emails using gmail smtp.

# Usage

sh roger.sh
