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
    build-essential
    coreutils
    curl
    direnv
    exa
    fd-find
    findutils
    fzf
    gh
    git
    git-extras
    htop
    jq
    locales
    moreutils
    make
    mosh
		ncdu
    neovim
    thefuck
    tig
    tmux
    tree
    vim
    wget
    yadm
    yarn
    zsh
  )

  sudo apt install -y "${apps[@]}"
  sudo ln -s $(which batcat) /usr/local/bin/bat
fi

