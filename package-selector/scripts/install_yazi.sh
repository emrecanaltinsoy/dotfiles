#!/usr/bin/env bash

## Install tokei if doesn't exist
if [ ! -x "$(command -v yazi)" ]; then
  echo "yazi is not installed! installing now."
  cargo install --force yazi-build -q
else
  echo "yazi is already installed."
fi
