# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Activate vi mode with Escape
set -o vi

# Set keyboard module to ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Set $EDITOR to emacsclient
export VISUAL="emacsclient -c -nw"
export EDITOR="emacsclient -c -nw"
