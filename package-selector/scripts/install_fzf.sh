#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.config/zsh/shared-aliases"

## Install fzf if doesn't exist
if [ ! -x "$(command -v fzf)" ]; then
  echo "fzf is not installed! installing now."
  install -y fzf || exit 1
else
  echo "fzf is already installed."
fi
