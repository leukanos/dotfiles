#!/bin/bash

# Update apt
apt update
apt dist-upgrade

apps=(
  awscli
  bash-completion2
  coreutils
  curl
  moreutils
  findutils
  git-extras
  tree
  htop
  wget
  thefuck
  tig
  libxml2
  libxslt
  jq
  z
  zsh-completions
)

apt install "${apps[@]}"