#!/bin/bash
COMMANDS="lock\nhibernate\nsleep\nlog out\nreboot\npower off"

COMMAND=`echo -e $COMMANDS | dmenu -b -i -p "choose action" "$@"`
echo $COMMAND
case $COMMAND in
	lock)
		exec slock
	;;
	hibernate)
		slock &
		exec systemctl hibernate
	;;
	sleep)
	        slock &
	        exec systemctl suspend
	;;
	"log out")
	        TTYS="tty1\ntty2\ntty3\ntty4\ntty5\ntty6"
		TTY=`echo -e $TTYS | dmenu -b -i -p "which tty?" "$@"`
		echo $TTY
		case $TTY in
		    tty1)
			exec kill -9 `ps -t tty1 | awk {'print $1'}`
		    ;;
		    tty2)
			exec kill -9 `ps -t tty2 | awk {'print $1'}`
		    ;;
		    tty3)
			exec kill -9 `ps -t tty3 | awk {'print $1'}`
		    ;;
		    tty4)
			exec kill -9 `ps -t tty4 | awk {'print $1'}`
		    ;;
		    tty5)
			exec kill -9 `ps -t tty5 | awk {'print $1'}`
		    ;;
		    tty6)
			exec kill -9 `ps -t tty6 | awk {'print $1'}`
		    ;;
		esac
	;;
	reboot)
		exec systemctl reboot
	;;
	"power off")
		exec systemctl poweroff
	;;
esac
