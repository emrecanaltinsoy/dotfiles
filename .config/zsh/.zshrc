# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/usr/local/go/bin:$PATH


export LC_ALL=C.UTF-8
export LANG=C.UTF-8

if [[ ! `which rustup` ]] then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/conda-zsh-completion ]] then
    git clone https://github.com/esc/conda-zsh-completion ~/.oh-my-zsh/custom/plugins/conda-zsh-completion
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]] then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/k ]] then
    git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
fi


# ZSH_THEME="robbyrussell"

## Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions k sudo copypath copybuffer dirhistory history conda-zsh-completion docker docker-compose)

source $ZSH/oh-my-zsh.sh

## Compilation flags
# export ARCHFLAGS="-arch x86_64"

## Aliases
source $HOME/.config/zsh/alias.rc

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

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source "$HOME/.cargo/env"

## CLI Tools
### Starship
eval "$(starship init zsh)"
### Mcfly
eval "$(mcfly init zsh)"
export MCFLY_RESULTS=20

neofetch

autoload -U compinit; compinit
