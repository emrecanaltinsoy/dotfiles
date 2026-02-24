window_root "$(pwd)"

CURRENT_DIR=$(pwd | xargs basename | sed 's/^\.//; s/\./-/g')

# Check if window with CURRENT_DIR name already exists
if tmux list-windows -F "#{window_name}" | grep -q "^${CURRENT_DIR}$"; then
  echo "Window '$CURRENT_DIR' already exists."
  select_window "$CURRENT_DIR"
else
  new_window "$CURRENT_DIR"
  echo "Window '$CURRENT_DIR' created."
  split_v 20
  select_pane 1
  run_cmd "nvim"
fi
