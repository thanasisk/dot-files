# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH=$PATH:/usr/local/go/bin:/usr/local/packer

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
# if we have colored prompt for git, let's enable it
if [ -d ".bash-git-prompt" ]; then
    source .bash-git-prompt/gitprompt.sh
fi
function epub2pdf {
    epub=$1
    ebook-convert "$epub" "${epub%.epub}.pdf"
}
function pdf2screen {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="${1%.pdf}"_screen.pdf "$1"
}
function webm2mp4 {
    ffmpeg -i "$1" -codec copy "${1%.webm}".mp4
}
function mp42mp3 {
    ffmpeg -i "$1" -vn -q:a 0 -map a "${1%.mp4}".mp3
}
function webm2mp3 {
    ffmpeg -i "$1" -vn -q:a 0 -map a "${1%.webm}".mp3
}
function mp42wav {
    ffmpeg -i "$1" -vn -q:a 0 -map a "${1%.mp4}".wav
}
function webm2wav {
    ffmpeg -i "$1" -vn -q:a 0 -map a "${1%.webm}".wav
}

