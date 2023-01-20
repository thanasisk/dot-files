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
# the rest require git ...
if ! [ -x "$(command -v git)" ]; then
    echo "needs git to install plugins"
    exit 127
fi
# some kung-fu is needed to avoid duplication of code but now is late ...
if [ ! -e ~/.vim/bundle/vim-go ]; then
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
fi

if [ ! -e ~/.vim/bundle/vim-terraform ]; then
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/bundle/vim-terraform
fi

if [ ! -e ~/.vim/bundle/nerdtree ]; then
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# I am becoming a Rust freak?!?
if [ ! -e ~/.vim/bundle/rust.vim ]; then
    git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
fi


# tagbar
if [ ! -e ~/.vim/bundle/tagbar ]; then
    git clone https://github.com/preservim/tagbar.git
fi

# OCaml?!? Am I really losing it?
if [ ! -e ~/,vim/bundle/vim-ocaml ]; then
    git clone https://github.com/ocaml/vim-ocaml.git
fi
