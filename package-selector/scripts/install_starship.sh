#!/usr/bin/env bash

## Install starship if doesn't exist
if [ ! -x "$(command -v starship)" ]; then
  echo "starship is not installed! installing now."
  curl -sS https://starship.rs/install.sh | sh
else
  echo "starship is already installed."
fi
