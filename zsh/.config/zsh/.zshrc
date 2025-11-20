# Pat/ to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.bin:$HOME/go/bin:/usr/local/go/bin::$PATH
export PATH=$PATH:/sbin:$HOME/.config/bin:$HOME/.amplify/bin:/opt/nvim-linux64/bin:$HOME/nvim-linux64/bin:$HOME/nvim-linux-x86_64/bin:$HOME/.local/bin:$HOME/.pulumi/bin
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH=/home/emrecan/.opencode/bin:$PATH

export PNPM_HOME="/home/emrecan/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

source $HOME/.config/zsh/install_packages.sh

## Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions k sudo copypath copybuffer dirhistory history docker docker-compose zsh-fzf-history-search)

# Removed
# conda-zsh-completion

source $ZSH/oh-my-zsh.sh

## Compilation flags
# export ARCHFLAGS="-arch x86_64"

export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH
export EDITOR=vim

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source "$HOME/.cargo/env"

## CLI Tools
### Zoxide
eval "$(zoxide init zsh --cmd cd)"
### Starship
eval "$(starship init zsh)"

# ### Mcfly
# eval "$(mcfly init zsh)"
# export MCFLY_RESULTS=20

### Tmuxifier
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export PATH=$PATH:$HOME/.tmuxifier/bin
eval "$(tmuxifier init -)"

# zsh essentials
HISTFILE="$HOME/.config/zsh/.histfile" # Save 100000 lines of history
HISTSIZE=100000
SAVEHIST=100000
setopt BANG_HIST            # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY     # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_DUPS     # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with a space.

### SSH
if [[ -f $HOME/.config/zsh/ssh ]]; then
  source ~/.config/zsh/ssh
fi

## Aliases
if [[ -f $HOME/.config/zsh/alias.rc ]]; then
  source $HOME/.config/zsh/alias.rc
fi

## Secrets
if [[ -f $HOME/.config/zsh/secrets ]]; then
  source $HOME/.config/zsh/secrets
fi

neofetch

## NVM
# place this after nvm initialization!
autoload -U add-zsh-hook

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
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

source $HOME/.config/zsh/starship_comp

# autoload -U compinit
compinit
