#!/usr/bin/env bash

## Install tokei if doesn't exist
if [ ! -x "$(command -v tokei)" ]; then
  echo "tokei is not installed! installing now."
  cargo install tokei -q --locked
else
  echo "tokei is already installed."
fi
