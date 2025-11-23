#!/usr/bin/env bash

## Install rm-improved if doesn't exist
if [ ! -x "$(command -v rip)" ]; then
  echo "rm-improved is not installed! installing now."
  cargo install rm-improved -q
else
  echo "rm-improved is already installed."
fi
