################
### Dotfiles ###
################
if [ ! -x "$(command -v stow)" ]; then
  echo "stow is not installed! installing now."
  install stow
fi

############
### OMZ  ###
############
if [[ ! -d ~/.oh-my-zsh ]]; then
  echo "oh-my-zsh is not installed! installing now."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
### RUST ###
############
## Install Rust if doesn't exist
if [ ! -x "$(command -v rustup)" ]; then
  echo "rustup is not installed! installing now."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
