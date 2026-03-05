#!/usr/bin/env bash
# sessionizer/commands.sh - Core command implementations

cmd_list() {
	local sessions
	sessions=$(get_active_sessions)

	if [[ -z "$sessions" ]]; then
		echo -e "${DIM}No active tmux sessions.${RESET}"
		return 0
	fi

	echo -e "${BOLD}Active tmux sessions:${RESET}"
	echo ""
	while IFS= read -r session; do
		local windows
		windows=$(tmux list-windows -t "=$session" -F "#{window_name}" 2>/dev/null | tr '\n' ', ' | sed 's/,$//')
		echo -e "  ${GREEN}${session}${RESET}  ${DIM}[${windows}]${RESET}"
	done <<<"$sessions"
}

cmd_projects() {
	parse_config || return 1

	if [[ ${#PROJECT_ORDER[@]} -eq 0 ]]; then
		echo -e "${DIM}No projects configured in ${CONFIG_FILE}${RESET}"
		return 0
	fi

	local active_sessions
	active_sessions=$(get_active_sessions)

	echo -e "${BOLD}Configured projects:${RESET}"
	echo ""
	for project in "${PROJECT_ORDER[@]}"; do
		local path session_name on_create status
		path=$(get_project_prop "$project" "path")
		session_name=$(get_project_prop "$project" "session_name")
		on_create=$(get_project_prop "$project" "on_create")

		# Check if session is active
		if echo "$active_sessions" | grep -qx "$session_name"; then
			status="${GREEN}active${RESET}"
		else
			status="${DIM}inactive${RESET}"
		fi

		echo -e "  ${CYAN}${project}${RESET}  [${status}]"
		echo -e "    path:    ${path}"
		[[ "$session_name" != "$project" ]] && echo -e "    session: ${session_name}"
		[[ -n "$on_create" ]] && echo -e "    run:     ${on_create}"
		echo ""
	done
}

cmd_create() {
	local project="$1"

	parse_config || return 1

	# Check if project exists in config
	if [[ -z "${PROJECT_PATH[$project]:-}" ]]; then
		echo -e "${RED}Error:${RESET} Project '${project}' not found in config."
		echo "Available projects:"
		for p in "${PROJECT_ORDER[@]}"; do
			echo "  - $p"
		done
		return 1
	fi

	local path session_name on_create
	path=$(expand_path "$(get_project_prop "$project" "path")")
	session_name=$(get_project_prop "$project" "session_name")
	on_create=$(get_project_prop "$project" "on_create")

	# Validate path
	if [[ ! -d "$path" ]]; then
		echo -e "${RED}Error:${RESET} Directory does not exist: ${path}"
		return 1
	fi

	# If session already exists, just attach/switch
	if tmux_session_exists "$session_name"; then
		echo -e "${DIM}Session '${session_name}' already exists. Switching...${RESET}"
		tmux_attach_or_switch "$session_name"
		return 0
	fi

	echo -e "Creating session ${GREEN}${session_name}${RESET} at ${path}..."

	# Create the session
	tmux new-session -d -s "$session_name" -c "$path"

	# Run on_create command if specified (before attach, since attach blocks)
	if [[ -n "$on_create" ]]; then
		tmux send-keys -t "=$session_name:" "$on_create" Enter
	fi

	# Attach or switch
	tmux_attach_or_switch "$session_name"
}

cmd_kill() {
	local target="$1"

	if ! tmux_session_exists "$target"; then
		echo -e "${RED}Error:${RESET} Session '${target}' does not exist."
		return 1
	fi

	tmux kill-session -t "=$target"
	echo -e "Killed session ${GREEN}${target}${RESET}."
}

cmd_help() {
	cat <<'EOF'
sessionizer - Manage tmux sessions from predefined project directories

USAGE:
    sessionizer                  Interactive fzf picker
    sessionizer list             List active tmux sessions
    sessionizer projects         List configured projects
    sessionizer create <name>    Create/attach session for a project
    sessionizer kill <name>      Kill a tmux session
    sessionizer help             Show this help message

INTERACTIVE MODE:
    When run with no arguments, an fzf picker shows:
      * = active sessions (select to switch)
      + = configured projects (select to create & attach)

CONFIG FILE:
    ~/.config/sessionizer/projects.conf

    INI-style format where each [section] defines a project:

        [DEFAULT]
        on_create = echo "ready"  # Default command for all projects

        [my-project]
        path = ~/projects/foo     # Required: project directory
        session_name = foo        # Optional: tmux session name (default: section name)
        on_create = nvm use       # Optional: command to run after session creation

CONTEXT:
    Works both inside and outside tmux:
      - Outside: creates/attaches sessions directly
      - Inside:  switches client to the target session

DEPENDENCIES:
    Required: tmux, bash
    Optional: fzf (interactive mode)
EOF
}
