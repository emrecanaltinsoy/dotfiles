#!/usr/bin/env bash

## Install starship if doesn't exist
if [ ! -x "$(command -v starship)" ]; then
  echo "starship is not installed! installing now."
  mkdir -p ~/.bin
  curl -sS https://starship.rs/install.sh | sh -s -- -y -b ~/.bin
else
  echo "starship is already installed."
fi
