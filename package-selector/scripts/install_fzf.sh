#!/usr/bin/env bash

## Install fzf if doesn't exist
if [ ! -x "$(command -v fzf)" ]; then
  echo "fzf is not installed! installing now."
  install fzf
else
  echo "fzf is already installed."
fi
