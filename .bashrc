# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Editing mode: emacs/vi
set -o emacs

# Exports
# PATH
export PATH=${PATH}:~/.local/bin

# Ignore duplicates in history
export HISTCONTROL=ignoreboth

# Set keyboard module to ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Set $EDITOR to emacsclient
export VISUAL="emacsclient -c -nw"
export EDITOR="emacsclient -c -nw"

# nvm
export NVM_DIR="$HOME/.local/src/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PS1
PS1='\W $ '

# Aliases
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -Alh'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias emacs='emacs -nw'
alias emacsclient='emacsclient -c -nw'
alias sudo='sudo '
alias dmenu='dmenu -sb "#33333f" -sf "#3355ff"'
