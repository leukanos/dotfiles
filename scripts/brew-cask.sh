#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew tap caskroom/fonts

# Install packages
apps=(
    firefox
    font-hack-nerd-font
    glimmerblocker
    opera
    slack
    vlc
    caffeine
    fantastical
    bartender
    openemu
    qnapi
    skitch
    sublime
    teamviewer
    virtualbox
    virtualbox-extension-pack
    whatsize
    postman
    filezilla
    the-unarchiver
)

brew cask search "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package