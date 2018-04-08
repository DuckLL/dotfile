#!/bin/bash

brew update

brew  install  ag
brew  install  apktool
brew  install  ctags
brew  install  dex2jar
brew  install  ffmpeg
brew  install  git
brew  install  httrack
brew  install  mycli
brew  install  neovim/neovim/neovim
brew  install  node
brew  install  p7zip
brew  install  python
brew  install  python3
brew  install  reattach-to-user-namespace
brew  install  rmtrash
brew  install  tmux
brew  install  yarn
brew  install  zsh

brew tap homebrew/php
brew install psysh

brew cleanup --force
brew prune
brew doctor
