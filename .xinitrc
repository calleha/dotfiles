# Disable access control for the current user.
xhost +SI:localuser:$USER &

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1 &

# Set default cursor.
xsetroot -cursor_name left_ptr &

# Set keyboard repeat rate and disable system beep.
xset r rate 200 60 &
xset b off &

# Uncomment the following block to use the exwm-xim module.
#export XMODIFIERS=@im=exwm-xim
#export GTK_IM_MODULE=xim
#export QT_IM_MODULE=xim
#export CLUTTER_IM_MODULE=xim

# Swap Left Control and Caps Lock (Options: ctrl:swapcaps / ctrl:nocaps)
setxkbmap -layout us -option ctrl:nocaps &
# hotkey daemon
sxhkd &
# xrandr settings
xrandr --newmode "640x480i" 13.218975 640 672 736 840 480 484 490 525 interlace -hsync -vsync &
xrandr --addmode VGA1 "640x480i" &
# picom
picom &
# Touchpad settings
xinput set-prop "Synaptics tm2964-001" "libinput Natural Scrolling Enabled" 1 &
# Automatic hibernation at 5% battery
~/.local/bin/hibernateat5percent.sh &
# Unclutter
unclutter -idle 5 -root &

# Finally start Emacs
exec emacs
