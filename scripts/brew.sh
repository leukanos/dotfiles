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
  autoconf
  autoenv
  awscli
  bash
  bash-completion@2
  brew-cask-completion
  coreutils
  cowsay
  csvkit
  ctop
  figlet
  findutils
  gdbm
  gettext
  gh
  git
  git-extras
  glances
  grep
  helm
  ht
  htop
  icu4c
  jq
  kubernetes-cli
  lazydocker
  ldns
  libcbor
  libfido2
  libgcrypt
  libgpg-error
  libidn2
  libunistring
  libxml2
  libxslt
  lzo
  mas
  maven
  mkcert
  mongocli
  moreutils
  ncdu
  ncurses
  node
  node@12
  node@14
  nvm
  oniguruma
  openjdk
  openssh
  openssl@1.1
  pcre
  pcre2
  pkg-config
  python@3.9
  rbenv
  readline
  ruby-build
  sqlite
  stern
  tcl-tk
  telnet
  the_silver_searcher
  thefuck
  tig
  tree
  watch
  wget
  xz
  yarn
  z
  zsh
  zsh-completions
  adoptopenjdk8
  graphiql
  ngrok
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
