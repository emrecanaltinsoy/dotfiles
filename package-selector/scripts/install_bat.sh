#!/usr/bin/env bash

## Install bat if doesn't exist
if [ ! -x "$(command -v bat)" ]; then
  echo "bat is not installed! installing now."
  cargo install bat --locked -q
else
  echo "bat is already installed."
fi
