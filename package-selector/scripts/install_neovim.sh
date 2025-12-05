#!/usr/bin/env bash

shopt -s expand_aliases

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if [[ ! -d "$HOME/nvim-linux-x86_64" ]]; then
  cd $HOME
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz -O "$HOME/nvim-linux-x86_64.tar.gz"
  tar xzvf nvim-linux-x86_64.tar.gz
  rm nvim-linux-x86_64.tar.gz
  cd $SCRIPT_DIR
else
  echo "Neovim already exists. skipping."
fi
