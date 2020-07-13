#!/bin/bash

# change default shell
chsh -s /usr/local/bin/zsh

# set dotfile
cp .zshrc ~/
cp .zimrc ~/
cp .p10k.zsh ~/
cp .vimrc ~/
mkdir -p ~/.config/nvim
ln ~/.vimrc ~/.config/nvim/init.vim
cp .tmux.conf ~/
cp .gemrc ~/
cp .gitconfig ~/
cp .gitignore_global ~/

# set vim
pip3 install neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +q +UpdateRemotePlugins +q

# set tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm --depth 1
