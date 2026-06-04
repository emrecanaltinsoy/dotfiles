# --- Function Definitions ---

# Auto activate/deactivate venv on cd
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

# Auto switch node version using nvm
load-nvmrc() {
    local nvmrc_path
    nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version
        nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
            nvm use
        fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
        nvm use default
    fi
}

# --- Hook Registration ---

autoload -U add-zsh-hook
add-zsh-hook chpwd check_and_activate_venv
if [ -x "$(command -v nvm)" ]; then
    add-zsh-hook chpwd load-nvmrc
fi

# --- Run both functions once on shell startup ---

check_and_activate_venv
if [ -x "$(command -v nvm)" ]; then
    load-nvmrc
fi

