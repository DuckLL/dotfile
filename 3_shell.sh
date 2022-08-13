#!/bin/bash

# change default shell
chsh -s $(which zsh)

# zsh
cp .zshrc ~/
cp .dircolors ~/
cp .p10k.zsh ~/

# tmux
cp .tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm --depth 1

# git
cp .gitconfig ~/
cp .gitignore_global ~/

# python
pip3 install pip -U
pip3 install --user \
    pipenv \
    pylint \
    yapf

# vim
cp .vimrc ~/
mkdir -p ~/.config/nvim
ln ~/.vimrc ~/.config/nvim/init.vim
pip3 install neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +q +UpdateRemotePlugins +q

# ramdisk
cp ramdisk.sh ~/
cp local.ramdisk.plist ~/Library/LaunchAgents/local.ramdisk.plist
launchctl load ~/Library/LaunchAgents/local.ramdisk.plist
launchctl start local.ramdisk
