#!/usr/bin/env bash

shopt -s expand_aliases

# Install neofetch if doesn't exist
if [ ! -x "$(command -v neofetch)" ]; then
  echo "neofetch is not installed! installing now."
  install neofetch || exit 1
else
  echo "neofetch is already installed."
fi
