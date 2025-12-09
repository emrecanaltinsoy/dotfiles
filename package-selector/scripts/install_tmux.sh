#!/usr/bin/env bash

shopt -s expand_aliases

source "$HOME/.config/zsh/shared-aliases"

OMT_PATH="$HOME/oh-my-tmux"

if [ ! -x "$(command -v tmux)" ]; then
  echo "tmux is not installed! installing now."
  install -y tmux || exit 1
else
  echo "tmux is already installed."
fi

if [[ ! -d $OMT_PATH ]]; then
  cd "$HOME" || exit 1
  git clone --single-branch https://github.com/gpakosz/.tmux.git "$OMT_PATH"
  mkdir -p "$HOME/.config/tmux"
  ln -s -f "$OMT_PATH/.tmux.conf" "$HOME/.config/tmux/tmux.conf"
else
  echo "$OMT_PATH already exists. skipping."
fi

if [[ ! -d ~/.tmuxifier ]]; then
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
else
  echo "$HOME/.tmuxifier already exists. skipping."
fi
