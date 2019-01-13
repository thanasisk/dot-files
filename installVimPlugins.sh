#!/bin/sh
set -eu
# to be executed via curl to instantly clone my vim setup

# if root, abort, do people really curl | sudo bash?
ID=`id -u`
if [ $ID -eq 0 ]; then
	echo "Do you really run remote code as root?"
	exit 1
fi

# backup .vimrc if already exists
if [ -e $HOME/.vimrc ]; then
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi

curl -LSso $HOME/.vimrc https://raw.githubusercontent.com/thanasisk/dot-files/master/vimrc
if [ ! -d $HOME/.vim_backup ]; then
	mkdir $HOME/.vim_backup
fi
mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/bundle
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
