session_root "$(pwd)"

SESSION_NAME="${SESSION_NAME:-$(basename "${BASH_SOURCE[0]}" .session.sh)}"
CURRENT_DIR=$(pwd | xargs basename | tr -cd 'a-zA-Z0-9')

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "$SESSION_NAME"; then

  # Create a new window inline within session layout definition.
  new_window "$CURRENT_DIR"

  select_window "$CURRENT_DIR"

  run_cmd "nvim"
  split_v 20
  select_pane 1
  split_h 30
  run_cmd "opencode"
fi

finalize_and_go_to_session
