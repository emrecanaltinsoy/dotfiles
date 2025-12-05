#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.config/zsh/shared-aliases"

if [ ! -x "$(command -v tmux)" ]; then
  echo "tmux is not installed! installing now."
  install -y tmux || exit 1
else
  echo "tmux is already installed."
fi

if [[ ! -d ~/.tmux ]]; then
  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -s -f .tmux/.tmux.conf
  cp .tmux/.tmux.conf.local .
else
  echo "~/.tmux already exists. skipping."
fi

if [[ ! -d ~/.tmuxifier ]]; then
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
else
  echo "~/.tmuxifier already exists. skipping."
fi
