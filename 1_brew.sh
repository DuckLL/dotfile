#!/bin/bash

brew bundle
brew cleanup --force
brew prune
brew doctor
