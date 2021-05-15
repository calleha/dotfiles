#!/bin/bash
LAYOUTS="us\nus -variant intl\nse"
echo -e $LAYOUTS | dmenu -p "choose layout" | xargs setxkbmap -option ctrl:nocaps -layout
