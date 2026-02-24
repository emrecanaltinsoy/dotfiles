cd "$HOME/Projects/dcr-ai-flagship" || exit

session_root "$(pwd)"

if initialize_session "dev-local"; then
  load_window "va-build-run"
  load_window "dev"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
