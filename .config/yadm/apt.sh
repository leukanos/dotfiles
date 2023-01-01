#!/bin/bash

if [[ $(uname) == 'Linux' ]]; then
  if ! [ -x "$(command -v add-apt-repository)" ]; then
    sudo apt install -y software-properties-common
  fi
  set +e

  # add repo to get gh
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
  sudo apt update
  sudo apt full-upgrade -y

  apps=(
    autoconf
    automake
    awscli
    bat
    build-essential
    cmake
    coreutils
    curl
    direnv
    exa
    fd-find
    findutils
    fzf
    gcc
    gh
    git
    git-extras
    htop
    jq
    libjansson-dev
    libseccomp-dev
    libxml2-dev
    libyaml-dev
    locales
    make
    moreutils
    mosh
    ncdu
    neovim
    ninja-build
    nodejs
    pkg-config
    python3
    python3-docutils
    python3-pip
    ripgrep
    thefuck
    tig
    tmux
    tree
    vim
    wget
    yadm
    zsh
  )

  sudo apt install -y "${apps[@]}"
  
  if ! hash bat 2>/dev/null; then
    sudo ln -s $(which batcat) /usr/local/bin/bat
  fi
fi

