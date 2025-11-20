############
# PACKAGES #
############

############
### OMZ  ###
############
if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "oh-my-zsh is not installed! installing now."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/conda-zsh-completion ]]; then
    git clone https://github.com/esc/conda-zsh-completion ~/.oh-my-zsh/custom/plugins/conda-zsh-completion
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/k ]]; then
    git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search ]]; then
    git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search
fi

############
### TMUX ###
############
if [ ! -x "$(command -v tmux)" ]; then
    echo "tmux is not installed! installing now."
    sudo apt install tmux
fi

if [[ ! -d ~/.tmux ]]; then
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
fi

# if [[ ! -d ~/.tmux/plugins/tpm ]] then
#     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# fi

if [[ ! -d ~/.tmuxifier ]]; then
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
fi

# Install neovim if doesn't exist
# if [[ ! -d ~/.config/nvim ]]; then
#     echo "lazyvim is not installed! installing now."
#     mv ~/.local/share/nvim ~/.local/share/nvim.bak
#     mv ~/.local/state/nvim ~/.local/state/nvim.bak
#     mv ~/.cache/nvim ~/.cache/nvim.bak
#     git clone https://github.com/LazyVim/starter ~/.config/nvim
#     rm -rf ~/.config/nvim/.git
# fi

# Install neofetch if doesn't exist
if [ ! -x "$(command -v neofetch)" ]; then
    echo "neofetch is not installed! installing now."
    sudo apt install neofetch
fi

## Install xh if doesn't exist
if [ ! -x "$(command -v xh)" ]; then
    echo "xh is not installed! installing now."
    curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
fi

## Install fzf if doesn't exist
if [ ! -x "$(command -v fzf)" ]; then
    echo "fzf is not installed! installing now."
    sudo apt install fzf
fi

############
### RUST ###
############
## Install Rust if doesn't exist
if [ ! -x "$(command -v rustup)" ]; then
    echo "rustup is not installed! installing now."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# # Install zellij if doesn't exist
# if [ ! -x "$(command -v zellij)" ]; then
#     echo "zellij is not installed! installing now."
#     cargo install --locked zellij
# fi

## Install alacritty if doesn't exist
# if [ ! -x "$(command -v alacritty)" ]; then
#     echo "alacritty is not installed! installing now."
#     sudo apt install libfontconfig1-dev libfontconfig
#     cargo install alacritty
# fi

## Install starship if doesn't exist
if [ ! -x "$(command -v starship)" ]; then
    echo "starship is not installed! installing now."
    curl -sS https://starship.rs/install.sh | sh
fi

## Install mcfly if doesn't exist
# if [ ! -x "$(command -v mcfly)" ]; then
#     echo "mcfly is not installed! installing now."
#     cargo install mcfly -q
# fi

## Install bat if doesn't exist
if [ ! -x "$(command -v bat)" ]; then
    echo "bat is not installed! installing now."
    cargo install bat --locked -q
fi

## Install exa if doesn't exist
if [ ! -x "$(command -v exa)" ]; then
    echo "exa is not installed! installing now."
    cargo install exa -q
fi

## Install xcp if doesn't exist
if [ ! -x "$(command -v xcp)" ]; then
    echo "xcp is not installed! installing now."
    cargo install xcp -q
fi

## Install rm-improved if doesn't exist
if [ ! -x "$(command -v rip)" ]; then
    echo "rm-improved is not installed! installing now."
    cargo install rm-improved -q
fi

## Install zoxide if doesn't exist
if [ ! -x "$(command -v zoxide)" ]; then
    echo "zoxide is not installed! installing now."
    cargo install zoxide --locked -q
fi

## Install ripgrep if doesn't exist
if [ ! -x "$(command -v rg)" ]; then
    echo "ripgrep is not installed! installing now."
    cargo install ripgrep -q
fi

## Install fd-find if doesn't exist
if [ ! -x "$(command -v fd)" ]; then
    echo "fd-find is not installed! installing now."
    cargo install fd-find -q
fi

## Install procs if doesn't exist
if [ ! -x "$(command -v procs)" ]; then
    echo "procs is not installed! installing now."
    cargo install procs -q
fi

## Install topgrade if doesn't exist
if [ ! -x "$(command -v topgrade)" ]; then
    echo "topgrade is not installed! installing now."
    cargo install topgrade -q --locked
fi

## Install tokei if doesn't exist
if [ ! -x "$(command -v tokei)" ]; then
    echo "tokei is not installed! installing now."
    cargo install tokei -q --locked
fi
