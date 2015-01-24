#!/bin/sh
#
## 连接nm的视讯主机vpn
#
nmcli con up id 视讯主机

#
## 搭建一个和路由、tq2440开发板同一个网段的ip,192.168.1.8, 使用8也是为了配合tq2440的tftp设置和网络设置
#
sudo ifconfig eth0:1 192.168.1.8 up

#
## 将eth0的网络转发出去，搭建一个路由器，该路由器的ip为192.168.0.1
#
sudo ifconfig eth0:0 192.168.0.1 up
sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
sudo service isc-dhcp-server start

#
## 运行XHCATV.exe登录视讯
#
#status_xhcatv=-1
#status_xhcatv=$(pgrep -l XHCATV | wc -l)
#if [ $status_xhcatv -eq 1 ]; then
#        echo "Kill进程XHCATV.exe"
#        pgrep -l XHCATV | awk '{print $1}' | xargs kill
#else
#        echo "启动视讯登录程序"
#	/usr/share/playonlinux/playonlinux --run "XHCATV" %F 
#fi

