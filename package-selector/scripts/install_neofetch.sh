#!/usr/bin/env bash

# Install neofetch if doesn't exist
if [ ! -x "$(command -v neofetch)" ]; then
  echo "neofetch is not installed! installing now."
  install neofetch
else
  echo "neofetch is already installed."
fi
