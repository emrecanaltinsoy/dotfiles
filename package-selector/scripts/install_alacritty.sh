#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.bash_aliases"

# Install alacritty if doesn't exist
if [ ! -x "$(command -v alacritty)" ]; then
  echo "alacritty is not installed! installing now."
  install libfontconfig1-dev libfontconfig || exit 1
  cargo install alacritty
else
  echo "alacritty is already installed."
fi
