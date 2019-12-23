#!/bin/bash

# Update apt
apt update
apt dist-upgrade -y

apps=(
  awscli
  coreutils
  curl
  direnv
  moreutils
  findutils
  git-extras
  tree
  htop
  wget
  thefuck
  tmux
  tig
  jq
  vim
)

apt install -y "${apps[@]}"
