#!/usr/bin/env bash

# Install alacritty if doesn't exist
if [ ! -x "$(command -v alacritty)" ]; then
  echo "alacritty is not installed! installing now."
  cargo install alacritty
else
  echo "alacritty is already installed."
fi
