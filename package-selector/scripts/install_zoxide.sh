#!/usr/bin/env bash

## Install zoxide if doesn't exist
if [ ! -x "$(command -v zoxide)" ]; then
  echo "zoxide is not installed! installing now."
  cargo install zoxide --locked -q
else
  echo "zoxide is already installed."
fi
