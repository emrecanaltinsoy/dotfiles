############
# NEOFETCH #
############
# Install neofetch if doesn't exist
if [ ! -x "$(command -v neofetch)" ]; then
    echo "neofetch is not installed! installing now."
    sudo apt install neofetch
fi

############
### RUST ###
############
## Install Rust if doesn't exist
if [ ! -x "$(command -v rustup)" ]; then
    echo "rustup is not installed! installing now."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

## Install starship if doesn't exist
if [ ! -x "$(command -v starship)" ]; then
    echo "starship is not installed! installing now."
    curl -sS https://starship.rs/install.sh | sh
fi

## Install mcfly if doesn't exist
if [ ! -x "$(command -v mcfly)" ]; then
    echo "mcfly is not installed! installing now."
    cargo install mcfly
fi


############
### OMZ  ###
############
if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "oh-my-zsh is not installed! installing now."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

############
### TMUX ###
############
if [ ! -x "$(command -v tmux)" ]; then
    echo "tmux is not installed! installing now."
    sudo apt install tmux
fi

if [[ ! -d ~/.tmux ]] then
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
fi

# if [[ ! -d ~/.tmux/plugins/tpm ]] then
#     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# fi

if [[ ! -d ~/.tmuxifier ]] then
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
fi
