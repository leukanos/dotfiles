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

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

apps=(
  awscli
  bash-completion2
  coreutils
  moreutils
  findutils
  git
  git-extras
  homebrew/completions/brew-cask-completion
  homebrew/dupes/grep
  homebrew/dupes/openssh
  imagemagick --with-webp
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
  teamocil
  the_silver_searcher
  z
  zsh
  zsh-completions
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup