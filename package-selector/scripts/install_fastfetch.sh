#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.config/zsh/shared-aliases"

# Install fastfetch if doesn't exist
if [ ! -x "$(command -v fastfetch)" ]; then
  echo "fastfetch is not installed! installing now."
  install -y fastfetch || exit 1
else
  echo "fastfetch is already installed."
fi
