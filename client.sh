#!/bin/sh
#
## 连接nm的视讯客户机接入点
#
nmcli con up id 视讯客户机

#
## 为了配置成和路由，开发板同一个网段
#
sudo ifconfig eth0:1 192.168.1.8 up
