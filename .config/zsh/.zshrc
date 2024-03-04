# Pat/ to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.bin:$HOME/go/bin:/usr/local/go/bin::$PATH
export PATH=$PATH:/sbin:$HOME/.config/bin:$HOME/.amplify/bin:/opt/nvim-linux64/bin:$HOME/nvim-linux64/bin
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export PNPM_HOME="/home/emrecan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


export LC_ALL=C.UTF-8
export LANG=C.UTF-8

source $HOME/.config/zsh/install_packages.sh

## Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions k sudo copypath copybuffer dirhistory history docker docker-compose)

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

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## CLI Tools
### Zoxide
eval "$(zoxide init zsh --cmd cd)"
### Starship
eval "$(starship init zsh)"
### Mcfly
eval "$(mcfly init zsh)"
export MCFLY_RESULTS=20

### Tmuxifier
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export PATH=$PATH:$HOME/.tmuxifier/bin
eval "$(tmuxifier init -)"

### SSH
if [[ -f ~/.config/zsh/ssh ]]; then
    source ~/.config/zsh/ssh
fi

## Aliases
source $HOME/.config/zsh/alias.rc

neofetch

autoload -U compinit; compinit
