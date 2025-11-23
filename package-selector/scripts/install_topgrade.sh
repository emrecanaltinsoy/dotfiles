#!/usr/bin/env bash

## Install topgrade if doesn't exist
if [ ! -x "$(command -v topgrade)" ]; then
  echo "topgrade is not installed! installing now."
  cargo install topgrade -q --locked
else
  echo "topgrade is already installed."
fi
