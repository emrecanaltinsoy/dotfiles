#!/usr/bin/env bash

DIR_NAME="${1:-$(basename "$(pwd)")}"
tmux renamew "$DIR_NAME"
tmux split-window -v -l 20
tmux select-pane -t 1
nvim .
