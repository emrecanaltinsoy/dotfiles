############################################################
# 1. Base Environment and Paths
############################################################
export GPG_TTY=$(tty)
export ZSH="$HOME/.oh-my-zsh"

export PATH=$HOME/.bin:$HOME/go/bin:/usr/local/go/bin::$PATH
export PATH=$PATH:/sbin:$HOME/.config/bin:$HOME/.amplify/bin:/opt/nvim-linux64/bin:$HOME/nvim-linux64/bin:$HOME/nvim-linux-x86_64/bin:$HOME/.local/bin:$HOME/.pulumi/bin
export PATH="${XDG_CONFIG_HOME:-$HOME/.config}/varlock/bin:$PATH"
export PATH=/home/emrecan/.opencode/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH
export EDITOR=nvim
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

############################################################
# 2. Language & Tool Version Managers
############################################################
# --- NVM (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Loads nvm bash_completion

# --- Ruby Gems ---
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# --- PNPM ---
export PNPM_HOME="/home/emrecan/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- Rust/Cargo ---
source "$HOME/.cargo/env"

# # --- Homebrew (optional, left commented as before) ---
# eval "$([ -x /home/linuxbrew/.linuxbrew/bin/brew ] && /home/linuxbrew/.linuxbrew/bin/brew shellenv)"

############################################################
# 3. Plugins and Oh My Zsh
############################################################
plugins=(git zsh-syntax-highlighting zsh-autosuggestions k sudo copypath copybuffer dirhistory history docker docker-compose zsh-fzf-history-search)
source $ZSH/oh-my-zsh.sh

############################################################
# 4. Aliases and Custom Loads
############################################################
if [[ -f $HOME/.config/zsh/shared-aliases ]]; then
  source $HOME/.config/zsh/shared-aliases
fi

## Compilation flags (uncomment/edit as needed)
# export ARCHFLAGS="-arch x86_64"

############################################################
# 5. Shell Options & History
############################################################
HISTFILE="$HOME/.config/zsh/.histfile"
HISTSIZE=100000
SAVEHIST=100000
setopt BANG_HIST            # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY     # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_DUPS     # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with a space.

############################################################
# 6. CLI Tools, UI & Completions
############################################################
# --- Zoxide ---
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh --cmd cd)"
fi
# --- Starship Prompt ---
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init zsh)"
fi
# --- Tmuxifier ---
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export PATH=$PATH:$HOME/.tmuxifier/bin
if [ -x "$(command -v tmux)" ]; then
  eval "$(tmuxifier init -)"
fi
# --- Starship Zsh Completion ---
if [[ -f $HOME/.config/zsh/starship_comp.zsh ]]; then
  source $HOME/.config/zsh/starship_comp.zsh
fi
# --- Terraform Completion ---
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
# --- txs completion ---
[[ -f "$HOME/.local/share/txs/completions/txs.zsh" ]] && source "$HOME/.local/share/txs/completions/txs.zsh"
# --- zsh completion ---
autoload -U compinit
compinit

############################################################
# 7. Secrets, Hooks & User Scripts
############################################################
if [[ -f $HOME/.config/zsh/secrets ]]; then
  source $HOME/.config/zsh/secrets
fi

if [[ -f $HOME/.config/zsh/chpwd_hooks.zsh ]]; then
  source $HOME/.config/zsh/chpwd_hooks.zsh
fi

# BEGIN ANSIBLE MANAGED BLOCK
# Include .bashrc.d folder for specific ansible dev feature
if [[ -d "$HOME/.bashrc.d" ]]; then
  for file in $(ls ${HOME}/.bashrc.d/ | sort -n | grep '.bashrc$' 2>/dev/null);
  do
    if [[ "$file" == *.bashrc ]]; then
      source "${HOME}/.bashrc.d/${file}"
    fi
  done
fi
# END ANSIBLE MANAGED BLOCK

if [[ -f "$HOME/.local/bin/env" ]]; then
  . "$HOME/.local/bin/env"
fi

############################################################
# 8. Visuals (Welcome Banner)
############################################################
if [ -x "$(command -v neofetch)" ]; then
  neofetch
fi

############################################################
# 9. Misc (NVM Hooks)
############################################################
# place this after nvm initialization!
autoload -U add-zsh-hook

