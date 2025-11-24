#!/usr/bin/env bash

shopt -s expand_aliases

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
CURRENT_SHELL=$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd)

## Get Aliases for Installation
source "$SCRIPT_DIR/zsh/.config/zsh/alias.rc"

## Update and Upgrade System
printf "Updating and upgrading system packages...\n"
update && upgrade -y

###########
### ZSH ###
###########
if [ ! -x "$(which zsh)" ]; then
  printf "zsh is not installed! installing now...\n"
  install zsh
else
  printf "zsh is already installed.\n"
fi

# install curl if not present
if [ ! -x "$(which curl)" ]; then
  printf "curl is not installed! installing now...\n"
  install curl
else
  printf "curl is already installed.\n"
fi

############
### OMZ  ###
############
if [ ! -d ~/.oh-my-zsh ]; then
  printf "oh-my-zsh is not installed! installing now...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  printf "oh-my-zsh is already installed.\n"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  printf "Installing zsh-syntax-highlighting plugin...\n"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
  printf "zsh-syntax-highlighting is already installed.\n"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  printf "Installing zsh-autosuggestions plugin...\n"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
  printf "zsh-autosuggestions is already installed.\n"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/k ]; then
  printf "Installing k plugin...\n"
  git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
else
  printf "k is already installed.\n"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search ]; then
  printf "Installing zsh-fzf-history-search plugin...\n"
  git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search
else
  printf "zsh-fzf-history-search is already installed.\n"
fi

############
### RUST ###
############
## Install Rust if doesn't exist
if [ ! -x "$(command -v rustup)" ]; then
  printf "Rust is not installed! installing now...\n"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  printf "Rust is already installed.\n"
fi

############
## PYTHON ##
############
## Install uv if doesn't exist
if [ ! -x "$(command -v uv)" ]; then
  printf "uv is not installed! installing now...\n"
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  printf "uv is already installed.\n"
fi

##############
## DOTFILES ##
##############
## Install stow for
if [ ! -x "$(command -v stow)" ]; then
  printf "stow is not installed! installing now...\n"
  install stow
else
  printf "stow is already installed.\n"
fi

## Ask user if they want to create symlinks with stow
printf "\nWould you like to create symlinks for all dotfiles using stow? (y/N) "
read -r response

case "$response" in
[yY]*)
  printf "Creating symlinks with stow...\n"
  stow */
  printf "Dotfiles symlinked successfully!\n"
  ;;
*)
  printf "Skipping symlink creation. Exiting.\n"
  ;;
esac

## Check and change default shell to zsh
if [ "$CURRENT_SHELL" != "$(which zsh)" ]; then
  printf "\nChanging default shell to zsh...\n"
  chsh -s "$(which zsh)"
  printf "Default shell changed to zsh. Please log out and log back in for the changes to take effect.\n"
else
  printf "\nDefault shell is already zsh.\n"
fi

## Ask user if they want to create symlinks with stow
printf "\nWould you like to run package selector? (y/N) "
read -r response_pkg

case "$response_pkg" in
[yY]*)
  cd "$SCRIPT_DIR/package-selector" || exit
  if [ ! -d .venv ]; then
    uv venv
  fi
  uv sync && uv run main.py
  ;;
*)
  printf "Skipping symlink creation. Exiting.\n"
  ;;
esac
