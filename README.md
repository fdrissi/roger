# Roger SkyLine /16

Install vim, apache2, iptables, iptables-persistent, fail2ban, postfix

Set static local ip address for your server.
Configure your firewall (iptables) to protect your webserver from DOS attacks, ssh brute froce, ports scanning.
Accept only connections via ssh, http, https.
Configure your ssh to accept only authentifications using RSA keys, and change the default port to 2222.
Configure postfix to send emails using gmail smtp.

# Usage

sh roger.sh
