session_root "$(pwd)"

SESSION_NAME="${SESSION_NAME:-$(basename "${BASH_SOURCE[0]}" .session.sh)}"

if tmux list-sessions | grep -q "^${SESSION_NAME}$"; then
  echo "Session '$SESSION_NAME' already exists."
else
  if initialize_session "$SESSION_NAME"; then
    echo "Session '$SESSION_NAME' created."
    load_window dev
  else
    load_window dev
  fi
fi

finalize_and_go_to_session
