#!/usr/bin/env bash

## Install xcp if doesn't exist
if [ ! -x "$(command -v xcp)" ]; then
  echo "xcp is not installed! installing now."
  cargo install xcp -q
else
  echo "xcp is already installed."
fi
