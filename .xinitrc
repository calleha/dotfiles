# Autostart
	# Swap Left Control and Caps Lock (Options: ctrl:swapcaps / ctrl:nocaps)
	setxkbmap -layout us -option ctrl:nocaps &
	xcape -e "Control_L=Escape" &
	# hotkey daemon
	sxhkd &
	# Emacs
	emacs --daemon &
	# Screen resolution (set accordingly)
	# xrandr --rate 144 &
	# Background
	feh --bg-fill ~/Pictures/grandcanyon/Cape_Royal_Sunset.jpg &
	# picom
	picom -c --config ~/.config/picom.conf &
	# Touchpad settings
	xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 &
	# Statusbar
	~/.local/bin/statusbar.sh &
	# Automatic hibernation at 5% battery
	~/.local/bin/hibernateat5percent.sh &
	# Unclutter
	unclutter -idle 5 -root &
	# mpd
	mpd &
	
exec dwm
