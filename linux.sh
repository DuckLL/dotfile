#!/bin/bash

# set dotfile
cp .bashrc ~/
mkdir -p ~/.trash
cp linux.vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln ~/.vimrc ~/.config/nvim/init.vim
cp linux.tmux.conf ~/.tmux.conf
cp .gemrc ~/
cp .gitconfig ~/
cp .gitignore_global ~/

