session_root "$(pwd)"

CURRENT_DIR=$(pwd | xargs basename | sed 's/^\.//; s/\./-/g')

SESSION_NAME="${SESSION_NAME:-$CURRENT_DIR}"

if tmux list-sessions -F "#{session_name}" | grep -q "^${SESSION_NAME}$"; then
  echo "Session '$SESSION_NAME' already exists."
  load_window dev
else
  if initialize_session "$SESSION_NAME"; then
    echo "Session '$SESSION_NAME' created."
    load_window dev
  else
    load_window dev
  fi
fi

finalize_and_go_to_session
