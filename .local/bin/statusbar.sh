#!/bin/bash
while true; do
    
VOL=$(echo 'vol' | tr '\n' ' ' && amixer get Master | awk -F'[][]' 'END{ print $4": "$2 }' | tr '\n' ' ' && echo "($(pactl info | grep Sink | tr '.' ' ' | awk '{print $NF}'))" | tr '\n' ' ')

MEM=$(echo 'mem:' | tr '\n' ' ' && free --giga -h | awk '(NR==2){ print $7 }' | tr '\n' ' ' && echo 'free' | tr '\n' ' ')

NET=$(echo 'net:' | tr '\n' ' ' && iwctl station wlan0 show | awk 'NR == 7 { print $3 }' | tr '\n' ' ' && iwctl station wlan0 show | awk 'NR == 6 { print "("$2")" }' | tr '\n' ' ')

BT=$(echo 'bt:' | tr '\n' ' ' && bluetoothctl info | grep Name | awk '{print $2}' | tr '\n' ' ')

MAIL=$(echo 'mail:' | tr '\n' ' ' && notmuch search tag:unread | wc -l | tr '\n' ' ')

BAT=$(echo 'bat:' | tr '\n' ' ' && cat /sys/class/power_supply/BAT0/capacity | awk '{ print $1"%" }' | tr '\n' ' ' && cat /sys/class/power_supply/BAT0/status | awk '{ print tolower("("$1")") }' | tr '\n' ' ')

DATE=$(date '+%Y-%m-%d %H:%M' | tr '\n' ' ')

    xsetroot -name " $MAIL |  $NET |  $VOL |  $MEM |  $BAT |  $DATE"
    sleep 30s
done &
