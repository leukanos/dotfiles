#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

apps=(
  awscli
  bash-completion2
  coreutils
  moreutils
  findutils
  git
  git-extras
  brew-cask-completion
  grep
  openssh
  tree
  htop
  wget
  thefuck
  rbenv
  nvm
  tig
  libxml2
  libxslt
  jq
  the_silver_searcher
  z
  zsh
  zsh-completions
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
