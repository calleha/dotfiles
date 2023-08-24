#!/bin/bash
LAYOUTS="us\nus -variant altgr-intl\nus -variant intl\nse\nfr\nel -variant polytonic"
echo -e $LAYOUTS | dmenu -b -p "choose layout" | xargs setxkbmap -option ctrl:nocaps -layout
