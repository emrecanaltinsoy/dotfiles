#!/usr/bin/env zsh
# Zsh completion for sessionizer

_sessionizer_projects() {
	local config="${XDG_CONFIG_HOME:-$HOME/.config}/sessionizer/projects.conf"
	[[ -f "$config" ]] || return
	# Extract [section] names, excluding [DEFAULT]
	sed -n 's/^\[\([a-zA-Z0-9_.-]*\)\]$/\1/p' "$config" | grep -v '^DEFAULT$'
}

_sessionizer_sessions() {
	tmux list-sessions -F '#{session_name}' 2>/dev/null
}

_sessionizer() {
	local -a subcommands=(
		'list:List active tmux sessions'
		'projects:List configured projects'
		'create:Create/attach session for a project'
		'kill:Kill a tmux session'
		'help:Show help message'
	)

	if (( CURRENT == 2 )); then
		_describe 'command' subcommands
		return
	fi

	case "${words[2]}" in
	create)
		local -a projects
		projects=("${(@f)$(_sessionizer_projects)}")
		[[ ${#projects[@]} -gt 0 ]] && _describe 'project' projects
		;;
	kill)
		local -a sessions
		sessions=("${(@f)$(_sessionizer_sessions)}")
		[[ ${#sessions[@]} -gt 0 ]] && _describe 'session' sessions
		;;
	esac
}

compdef _sessionizer sessionizer
