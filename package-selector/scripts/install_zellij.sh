#!/usr/bin/env bash

# Install zellij if doesn't exist
if [ ! -x "$(command -v zellij)" ]; then
  echo "zellij is not installed! installing now."
  cargo install --locked zellij -q
else
  echo "zellij is already installed."
fi
