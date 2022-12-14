#!/bin/bash

if [[ $(uname) == 'Linux' ]]; then
  if ! [ -x "$(command -v add-apt-repository)" ]; then
    sudo apt install -y software-properties-common
  fi
  set +e

  # add repo to get newest git
  sudo add-apt-repository -y ppa:git-core/ppa
  # add repo to get newest tmux
  sudo add-apt-repository -y ppa:pi-rho/dev
  # add repo to get gh
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
  sudo apt-add-repository -y https://cli.github.com/packages
  sudo apt update
  sudo apt full-upgrade -y

  apps=(
    awscli
    bat
    coreutils
    curl
    direnv
    exa
    findutils
    fzf
    gh
    git-extras
    htop
    jq
    moreutils
    neovim
    thefuck
    tig
    tmux
    tree
    vim
    wget
    yadm
    yarn
  )

  apt install -y "${apps[@]}"
fi