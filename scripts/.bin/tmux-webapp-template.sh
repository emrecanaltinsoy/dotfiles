#!/usr/bin/env bash

DIR_NAME="${1:-$(basename "$(pwd)")}"
tmux renamew "$DIR_NAME"
tmux split-window -v -l 20 -d
tmux split-window -t "$pane.2" -h -d
tmux send-keys -t "$pane.3" "cd frontend && pnpm dev" Enter
tmux select-pane -t 1
nvim .
