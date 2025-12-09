#!/usr/bin/env bash

shopt -s expand_aliases

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Install neofetch if doesn't exist
if [ ! -x "$(command -v aws)" ]; then
  cd "$HOME" || exit 1
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install

  rm awscliv2.zip
  cd "$SCRIPT_DIR" || exit 1
else
  echo "aws-cli is already installed."
fi
