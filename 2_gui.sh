#!/bin/bash

brew tap caskroom/cask

# sync first
brew  cask  install  bettertouchtool
brew  cask  install  dropbox
brew  cask  install  evernote
brew  cask  install  google-chrome
brew  cask  install  google-backup-and-sync
# others
brew  cask  install  airdroid
brew  cask  install  android-file-transfer
brew  cask  install  appcleaner
brew  cask  install  betterzip
brew  cask  install  charles
brew  cask  install  daisydisk
brew  cask  install  docker
brew  cask  install  enjoyable
brew  cask  install  firefox
brew  cask  install  handbrake
brew  cask  install  hex-fiend
brew  cask  install  imageoptim
brew  cask  install  iterm2
brew  cask  install  keepassxc
brew  cask  install  keka
brew  cask  install  lulu
brew  cask  install  lyricsx
brew  cask  install  messenger
brew  cask  install  microsoft-office
brew  cask  install  nordvpn
brew  cask  install  nox-app-player
brew  cask  install  open-in-code
brew  cask  install  outline-manager
brew  cask  install  qlcolorcode
brew  cask  install  qlmarkdown
brew  cask  install  qlvideo
brew  cask  install  ripple-wallet
brew  cask  install  skype
brew  cask  install  smcfancontrol
brew  cask  install  sourcetree
brew  cask  install  spotify
brew  cask  install  steam
brew  cask  install  teamviewer
brew  cask  install  telegram
brew  cask  install  tor-browser
brew  cask  install  tunnelblick
brew  cask  install  visual-studio-code
brew  cask  install  vlc
brew  cask  install  vmware-fusion
brew  cask  install  wireshark
# java
brew  cask  install  jdownloader
brew  cask  install  java
brew  cask  install  jd-gui

brew cask cleanup
brew cask doctor
