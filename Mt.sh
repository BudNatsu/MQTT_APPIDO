#!/bin/bash

wifi=$(grep "^\s*w" /proc/net/wireless | awk '{print $4}');
wifip=$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70)}');
while true ; 

do mosquitto_pub -h 172.30.42.192 -t iot/msg -m "wifi2,host=buddy puissanced=$wifi" -u buddy -P monomes  ;

mosquitto_pub -h 172.30.42.192 -t iot/msg -m "wifi,host=buddy wifi=$wifip" -u buddy -P monomes  ;	
done;
