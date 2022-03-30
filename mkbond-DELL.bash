#!/bin/bash
mkdir /root/network-backup
mv /etc/sysconfig/network-scripts/ifcfg-em* /root/network-backup
systemctl restart NetworkManager
nmcli con add type bond con-name bond0 ifname bond0 bond.options "mode=802.3ad,miimon=100,updelay=0,downdelay=0"
nmcli con add type bond-slave ifname em1 con-name em1 master bond0
nmcli con add type bond-slave ifname em2 con-name em2 master bond0
systmectl restart NetworkManager
