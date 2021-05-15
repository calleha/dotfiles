#!/bin/bash
while true; do
    
STATUS=`cat /sys/class/power_supply/BAT0/status`
LEVEL=`cat /sys/class/power_supply/BAT0/capacity`

if [[ $STATUS = "Discharging" && $LEVEL -le "5" ]]
   then
       slock &
       systemctl hibernate
fi

    sleep 180s
done &
