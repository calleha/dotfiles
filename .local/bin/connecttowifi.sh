nmcli d wifi list | dmenu -l 32 -sb '#33333f' -sf '#3355ff' | awk '{print $1}' | xargs -L1 st -t 'st (floating)' -g 60x5 -e nmcli -a d wifi connect
