session_root "$(pwd)"

SESSION_NAME="${SESSION_NAME:-$(basename "${BASH_SOURCE[0]}" .session.sh)}"
CURRENT_DIR=$(pwd | xargs basename | tr -cd 'a-zA-Z0-9')

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if
  initialize_session "$SESSION_NAME" &
  new_window "$CURRENT_DIR"
then

  select_window "$CURRENT_DIR"

  split_v
  select_pane 2
  run_cmd "tmux resize-pane -t 2 -y 10; clear"
  select_pane 1
  run_cmd "nvim"
  # We can start opencode with tmux provider with <leader>oT
  # split_h 30
  # run_cmd "opencode"
fi

finalize_and_go_to_session
