#!/bin/bash
# Configuration ip statique
ifup ifcfg-ens33
confip="/etc/sysconfig/network-scripts/ifcfg-ens33"
echo " "
read -p "Entrer l'adresse ip de la machine : " ipadd
/bin/cat <<EOM >$confip
TYPE=Ethernet
ROXY_METHOD=none
BROWSER_ONLY=no

# Config Statique
BOOTPROTO=static
IPADDR=$ipadd
NETWORK=10.0.0.0
NETMASK=255.255.0.0
GATEWAY=10.0.255.1

DEFROUTE=yes
IPV4_FAILURE_FATAL=no
NAME=ens33
UUID=c1e00425-4111-40f2-9ada-49ca8e6e19c9
DEVICE=ens33
ONBOOT=yes
ZONE=public
EOM

# Config dns
dns="/etc/resolv.conf"
echo " "
/bin/cat <<EOM >$dns
search iaas.dbz
nameserver 8.8.8.8
nameserver 8.8.4.4
EOM

# Restart du service réseau
service network restart >/dev/null
echo " "
[ $? -eq 0 ] && echo "Script de configuration terminé, connectez vous sur root@$ipadd !" || echo "Echec de configuration de l'adressage statique !"
echo " "
