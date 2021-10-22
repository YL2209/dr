#!/bin/sh
user=08560013298365
pwd=442924
r=1
rs=`head -n 128 /dev/urandom | tr -dc "0123456789" | head -c4`
url="http://203.210.93.15/drcom/login?callback=dr1004&DDDDD=$user&upass=$pwd&0MKKey=123456&R1=0&R3=$r&R6=0&para=00&v6ip=&v=$rs"
ping -c 1 223.6.6.6 > /dev/null 2>&1
if [ $? -eq 0 ];then
    echo "Internet OK" > /etc/dr/ping.txt
else
    echo "Internet NO" >> /etc/dr/ping.txt
    wget $url -O log.txt
    sleep 5
    ping -c 1 114.114.114.114 > /dev/null 2>&1
    if [ $? -eq 0 ];then
        echo "Internet OK" > /etc/dr/ping.txt
    else
	echo "Internet NO" >> /etc/dr/ping.txt
        wget $url -O log.txt
    fi
fi
