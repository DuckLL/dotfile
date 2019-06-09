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

# set vim
pip3 install pip -U
pip3 install pynvim --user
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +q +UpdateRemotePlugins +q
