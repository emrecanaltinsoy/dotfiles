window_root "$HOME/Projects/dcr-ai-flagship"

WINDOW_NAME="build-run"

# Check if window with WINDOW_NAME name already exists
if tmux list-windows -F "#{window_name}" | grep -q "^${WINDOW_NAME}$"; then
  echo "Window '$WINDOW_NAME' already exists."
  select_window "$WINDOW_NAME"
else
  new_window "$WINDOW_NAME"
  echo "Window '$WINDOW_NAME' created."
  run_cmd "nrb"
  split_h 50
  run_cmd "nrw"
fi
