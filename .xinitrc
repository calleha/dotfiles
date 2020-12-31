# Autostart
	# Swap Left Control and Caps Lock (Options: ctrl:swapcaps / ctrl:nocaps)
	setxkbmap -layout us -option ctrl:nocaps -variant altgr-intl &
	xcape -e "Control_L=Escape" &
	# hotkey daemon
	sxhkd &
	# Emacs
	emacs --daemon &
	# Screen resolution (set accordingly)
	xrandr --rate 120 &
	# Background
	feh --bg-fill ~/Pictures/manarola-3840x2400-cityscape-city-lights-ocean-dusk-italy-4k-19273.jpg &
	# picom
	picom -c --config ~/.config/picom.conf &
	# Touchpad settings
	# xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 &
	# Statusbar
	~/.local/bin/statusbar.sh &
	# unclutter
	unclutter -idle 5 -root &
	
exec dwm
