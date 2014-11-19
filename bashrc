# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# put timestamps in my bash history
export HISTTIMEFORMAT='%F %T '
# don't put duplicate commands into the history
export HISTCONTROL=ignoredups
# record only the most recent duplicated command (see above)
export HISTCONTROL=ignoreboth
# don't record these commands in the history; who cares about ls?
export HISTIGNORE='pwd:ls:lh:la:ll:history:'
# keep the history size up to 4096 lines
export HISTSIZE=4096
# force my editor environment variable to be vim (the ONLY correct editor)
export EDITOR='/usr/bin/vim'
# a setting that does its best to keep ssh connections from freezing
export AUTOSSH_POLL=30
# get color settings for directory listings (ls)
eval `dircolors`
# list directories with color
alias ls='ls --color=auto'
# shortcut aliases for the ls command that render different types of output
alias dir='ls --color=auto --format=vertical'
alias ll='ls -Al'
alias la='ls -A'
alias lh='ls -Alh'
# highlight grep matches with color
alias grep='grep --color=auto'
# shortcut aliases for the grep command with different behaviors
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
