#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.bash_aliases"

## Install fzf if doesn't exist
if [ ! -x "$(command -v fzf)" ]; then
  echo "fzf is not installed! installing now."
  install fzf || exit 1
else
  echo "fzf is already installed."
fi
