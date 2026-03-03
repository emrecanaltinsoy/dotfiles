cd "$HOME/Projects/dcr-ai-flagship" || exit

session_root "$(pwd)"

if initialize_session "dev-local"; then
  load_window "dev"
  select_pane 2
  split_h 25
  run_cmd "nrw"
  split_h 50
  run_cmd "nrb"
  select_pane 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
