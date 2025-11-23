#!/usr/bin/env bash

## Install procs if doesn't exist
if [ ! -x "$(command -v procs)" ]; then
  echo "procs is not installed! installing now."
  cargo install procs -q
else
  echo "procs is already installed."
fi
