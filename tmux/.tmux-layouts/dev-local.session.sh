# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/Projects/dcr-ai-flagship"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dev-local"; then

  # Create a new window inline within session layout definition.
  new_window "build-run"
  new_window "terminal"
  new_window "neovim"

  select_window "build-run"
  run_cmd "nrb"
  split_h 50
  run_cmd "nrw"
  # Load a defined window layout.

  select_window "neovim"
  run_cmd "nvim ."

  # Select the default active window on session creation.
  #select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
