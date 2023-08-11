# Pat/ to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.bin:$HOME/go/bin:/usr/local/go/bin::$PATH
export PATH=$PATH:/sbin:$HOME/.config/bin:$HOME/.amplify/bin

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

source $HOME/.config/zsh/install_packages.sh

## Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions k sudo copypath copybuffer dirhistory history conda-zsh-completion docker docker-compose)

source $ZSH/oh-my-zsh.sh

## Compilation flags
# export ARCHFLAGS="-arch x86_64"


## Conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH
export EDITOR=vim

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source "$HOME/.cargo/env"

## CLI Tools
### Zoxide
eval "$(zoxide init zsh)"
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
