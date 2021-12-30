#!/bin/bash
while true; do
    
VOL=$(echo 'Volume' | tr '\n' ' ' && amixer get Master | awk -F'[][]' 'END{ print $4": "$2 }' | tr '\n' ' ' && echo "($(pactl info | grep Sink | tr '.' ' ' | awk '{print $NF}'))" | tr '\n' ' ')

MEM=$(echo 'Available Memory:' | tr '\n' ' ' && free --giga -h | awk '(NR==2){ print $7 }' | tr '\n' ' ')

#NET=$(echo 'Network:' | tr '\n' ' ' && nmcli c show --active | awk 'FNR == 2 { print $1 }' | tr '\n' ' ' && nmcli n connectivity | awk '{ print "("$1")" }' | tr '\n' ' ')

#BT=$(echo 'BT:' | tr '\n' ' ' && bluetoothctl info | grep Name | awk '{print $2}' | tr '\n' ' ')

MAIL=$(echo 'New Mail:' | tr '\n' ' ' && notmuch search tag:unread | wc -l | tr '\n' ' ')

#BAT=$(echo 'Battery:' | tr '\n' ' ' && cat /sys/class/power_supply/BAT0/capacity | awk '{ print $1"%" }' | tr '\n' ' ' && cat /sys/class/power_supply/BAT0/status | awk '{ print "("$1")" }' | tr '\n' ' ')

DATE=$(date '+%Y-%m-%d %H:%M' | tr '\n' ' ')

    xsetroot -name " $MAIL |  $VOL |  $MEM |  $DATE"
    sleep 30s
done &
