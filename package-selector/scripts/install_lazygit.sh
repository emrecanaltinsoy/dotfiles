#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.config/zsh/shared-aliases"

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if [ ! -x "$(command -v git)" ]; then
  install git
else
  echo "git already installed. skipping"
fi

if [ ! -x "$(command -v lazygit)" ]; then
  cd "$HOME" || exit 1
  wget https://github.com/jesseduffield/lazygit/releases/download/v0.56.0/lazygit_0.56.0_linux_x86_64.tar.gz -O "$HOME/lazygit_0.56.0_linux_x86_64.tar.gz"
  tar xzvf lazygit_0.56.0_linux_x86_64.tar.gz
  mkdir -p "$HOME/.bin"
  mv "$HOME/lazygit" "$HOME/.bin/lazygit"
  rm lazygit_0.56.0_linux_x86_64.tar.gz
  cd "$SCRIPT_DIR" || exit 1
else
  echo "lazygit already exists. skipping."
fi

if [ ! -x "$(command -v delta)" ]; then
  cargo install git-delta -q
else
  echo "delta already installed. skipping"
fi
