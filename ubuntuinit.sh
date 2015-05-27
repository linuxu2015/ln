#!/bin/bash
read -p "输入要使用的IP地址：" ip
read -p "输入要使用的网关地址：" gateway
cat >> interface <<EOF
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
address $ip
netmask 255.255.255.0
gateway $gateway
dns-nameservers 114.114.114.114
EOF
#####更改apt源为阿里云#########
mv /etc/apt/sources.list{,.bak}
cat >> /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
EOF
apt-get update
