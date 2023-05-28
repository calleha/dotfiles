#!/bin/bash
LAYOUTS="us\nus -variant intl\nse\nfr"
echo -e $LAYOUTS | dmenu -p "choose layout" | xargs setxkbmap -option ctrl:nocaps -layout
