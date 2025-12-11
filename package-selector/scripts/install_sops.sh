#!/usr/bin/env bash

# Install sops if doesn't exist
if [ ! -x "$(command -v sops)" ]; then
  # Download the binary
  mkdir -p "$HOME/.bin"
  wget https://github.com/getsops/sops/releases/download/v3.11.0/sops-v3.11.0.linux.amd64 -O "$HOME/.bin/sops"

  # Make the binary executable
  chmod +x "$HOME/.bin/sops"
else
  echo "sops is already installed."
fi
