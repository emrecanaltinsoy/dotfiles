#!/usr/bin/env bash

## Install ripgrep if doesn't exist
if [ ! -x "$(command -v rg)" ]; then
  echo "ripgrep is not installed! installing now."
  cargo install ripgrep -q
else
  echo "ripgrep is already installed."
fi
