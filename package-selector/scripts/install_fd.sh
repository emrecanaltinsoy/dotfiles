#!/usr/bin/env bash

## Install fd-find if doesn't exist
if [ ! -x "$(command -v fd)" ]; then
  echo "fd-find is not installed! installing now."
  cargo install fd-find -q
else
  echo "fd-find is already installed."
fi
