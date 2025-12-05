#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.config/zsh/shared-aliases"

## Install fzf if doesn't exist
if [ ! -x "$(command -v opencode)" ]; then
  echo "opencode is not installed! installing now."
  curl -fsSL https://opencode.ai/install | bash
else
  echo "opencode is already installed."
fi
