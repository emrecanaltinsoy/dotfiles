check_and_activate_venv() {
    if [[ -d ".venv" ]]; then
        if [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
            source .venv/bin/activate
        fi
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        if [[ "$PWD" != "${VIRTUAL_ENV%/*}"* ]]; then
            deactivate
        fi
    fi
}

load-nvmrc() {
    if ! declare -f nvm_find_nvmrc > /dev/null 2>&1; then
        local check=$PWD
        while [[ "$check" != "/" ]]; do
            [[ -f "$check/.nvmrc" ]] && { _nvm_load; break; }
            check=${check:h}
        done
        declare -f nvm_find_nvmrc > /dev/null 2>&1 || return
    fi
    local nvmrc_path
    nvmrc_path="$(nvm_find_nvmrc)"
    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version
        local nvmrc_config_version
        nvmrc_config_version=$(cat "${nvmrc_path}")
        nvmrc_node_version=$(nvm version "$nvmrc_config_version")
        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
        fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
        nvm use default
    fi
}


autoload -U add-zsh-hook
add-zsh-hook chpwd check_and_activate_venv
add-zsh-hook chpwd load-nvmrc

check_and_activate_venv
load-nvmrc

