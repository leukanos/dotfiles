#!/bin/bash

if [[ $(uname) == 'Linux' ]]; then
  if ! [ -x "$(command -v add-apt-repository)" ]; then
    sudo apt install -y software-properties-common
  fi
  set +e

  if ! hash op 2>/dev/null; then
    echo "Installing op..."
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \ 
      sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
      sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
      sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
      sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpgV
  fi

  # add repo to get gh
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
  sudo apt update
  sudo apt full-upgrade -y

  apps=(
    1password-cli
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
    unzip
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

