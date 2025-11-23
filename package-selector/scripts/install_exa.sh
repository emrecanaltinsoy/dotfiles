#!/usr/bin/env bash

## Install exa if doesn't exist
if [ ! -x "$(command -v exa)" ]; then
  echo "exa is not installed! installing now."
  cargo install exa -q
else
  echo "exa is already installed."
fi
