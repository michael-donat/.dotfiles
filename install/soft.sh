#!/bin/bash

set -ev

brew install netcat || true
brew install wget || true
brew install curl || true
brew install pwgen || true
brew install bash-completion || true

brew install caskroom/cask/brew-cask || true
brew cask install iterm2 || true