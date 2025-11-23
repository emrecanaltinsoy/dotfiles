#!/usr/bin/env bash

## Install xh if doesn't exist
if [ ! -x "$(command -v xh)" ]; then
  echo "xh is not installed! installing now."
  curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
else
  echo "xh is already installed."
fi
