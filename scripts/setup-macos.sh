#!/usr/bin/env bash
# setup-macos.sh — macOS (Apple Silicon) dev environment setup
#
# Usage:
#   bash setup-macos.sh
#   bash setup-macos.sh --skip aws_cli,terraform,docker
#
# Skip keys:
#   homebrew, git, rustup, nvm, oh_my_zsh, dotfiles,
#   aws_cli, lazygit, neovim, opencode, pi, herdr, sops, starship,
#   terraform, tmux, oh_my_tmux, tmuxifier, txs, just,
#   eza, git_delta, rm_improved, topgrade, xcp, yazi,
#   procs, tokei, xh, zellij, zoxide, bat, fd, ripgrep

set -euo pipefail

# ── versions ────────────────────────────────────────────────────────────────
LAZYGIT_VERSION="0.44.1"
NVM_VERSION="0.40.1"
SOPS_VERSION="3.9.0"

# ── colour helpers ───────────────────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; RESET='\033[0m'
info()  { echo -e "${GREEN}==>${RESET} $*"; }
warn()  { echo -e "${YELLOW}SKIP${RESET} $*"; }
error() { echo -e "${RED}ERROR${RESET} $*" >&2; }

# ── parse --skip argument ────────────────────────────────────────────────────
SKIP=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip)
      IFS=',' read -ra SKIP <<< "$2"
      shift 2 ;;
    *) error "Unknown argument: $1"; exit 1 ;;
  esac
done

skip() { [[ " ${SKIP[*]+${SKIP[*]}} " == *" $1 "* ]]; }

# ── guard: Apple Silicon only ────────────────────────────────────────────────
if [[ "$(uname -s)" != "Darwin" ]]; then
  error "This script is for macOS only."
  exit 1
fi
if [[ "$(uname -m)" != "arm64" ]]; then
  error "This script requires Apple Silicon (arm64)."
  exit 1
fi

export PATH="/opt/homebrew/bin:$HOME/.bin:$HOME/.cargo/bin:$PATH"

# ── homebrew ─────────────────────────────────────────────────────────────────
if skip homebrew; then
  warn "homebrew"
else
  if ! command -v brew &>/dev/null; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:$PATH"
  else
    info "Homebrew already installed"
  fi
  info "Updating Homebrew..."
  brew update -q
fi

# ── brew install helper ───────────────────────────────────────────────────────
brew_install() {
  local pkg=$1 bin=${2:-$1}
  if command -v "$bin" &>/dev/null; then
    info "$pkg already installed"
  else
    info "Installing $pkg..."
    brew install "$pkg"
  fi
}

# ── git ───────────────────────────────────────────────────────────────────────
if skip git; then warn "git"; else brew_install git; fi

# ── rustup ───────────────────────────────────────────────────────────────────
if skip rustup; then
  warn "rustup"
else
  if command -v rustup &>/dev/null; then
    info "rustup already installed"
  else
    info "Installing rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    export PATH="$HOME/.cargo/bin:$PATH"
  fi
fi

# ── nvm + node ────────────────────────────────────────────────────────────────
if skip nvm; then
  warn "nvm"
else
  if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    info "nvm already installed"
  else
    info "Installing nvm..."
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash
  fi
  export NVM_DIR="$HOME/.nvm"
  # shellcheck source=/dev/null
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  if ! nvm ls --no-colors 2>/dev/null | grep -q 'v[0-9]'; then
    info "Installing Node LTS..."
    nvm install --lts
    nvm alias default 'lts/*'
  else
    info "Node already installed"
  fi
fi

# ── oh-my-zsh ─────────────────────────────────────────────────────────────────
if skip oh_my_zsh; then
  warn "oh_my_zsh"
else
  if [[ -d "$HOME/.oh-my-zsh" ]]; then
    info "Oh-My-Zsh already installed"
  else
    info "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  fi
  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  for plugin_repo in \
    "https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting" \
    "https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions" \
    "https://github.com/supercrabtree/k k" \
    "https://github.com/joshskidmore/zsh-fzf-history-search zsh-fzf-history-search"
  do
    repo=$(echo "$plugin_repo" | cut -d' ' -f1)
    name=$(echo "$plugin_repo" | cut -d' ' -f2)
    if [[ -d "$ZSH_CUSTOM/plugins/$name" ]]; then
      info "zsh plugin $name already installed"
    else
      info "Installing zsh plugin $name..."
      git clone "$repo" "$ZSH_CUSTOM/plugins/$name"
    fi
  done
fi

# ── brew packages ─────────────────────────────────────────────────────────────
if skip aws_cli;   then warn "aws_cli";   else brew_install awscli aws;         fi
if skip lazygit;   then warn "lazygit";   else brew_install lazygit;            fi
if skip neovim;    then warn "neovim";    else brew_install neovim nvim;        fi
if skip sops;      then warn "sops";      else brew_install sops;               fi
if skip terraform; then warn "terraform"; else brew_install terraform;          fi
if skip tmux;      then warn "tmux";      else brew_install tmux;               fi
if skip eza;       then warn "eza";       else brew_install eza;                fi
if skip git_delta; then warn "git_delta"; else brew_install git-delta delta;    fi
if skip rm_improved; then warn "rm_improved"; else brew_install rm-improved rip; fi
if skip topgrade;  then warn "topgrade";  else brew_install topgrade;           fi
if skip xcp;       then warn "xcp";       else brew_install xcp;                fi
if skip yazi;      then warn "yazi";      else brew_install yazi;               fi
if skip procs;     then warn "procs";     else brew_install procs;              fi
if skip tokei;     then warn "tokei";     else brew_install tokei;              fi
if skip xh;        then warn "xh";        else brew_install xh;                 fi
if skip zellij;    then warn "zellij";    else brew_install zellij;             fi
if skip zoxide;    then warn "zoxide";    else brew_install zoxide;             fi
if skip bat;       then warn "bat";       else brew_install bat;                fi
if skip fd;        then warn "fd";        else brew_install fd;                 fi
if skip ripgrep;   then warn "ripgrep";   else brew_install ripgrep rg;         fi
if skip fzf;       then warn "fzf";       else brew_install fzf;                fi

# ── universal installers ─────────────────────────────────────────────────────
if skip starship; then
  warn "starship"
else
  if command -v starship &>/dev/null; then
    info "starship already installed"
  else
    info "Installing starship..."
    mkdir -p "$HOME/.bin"
    curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.bin"
  fi
fi

if skip opencode; then
  warn "opencode"
else
  if command -v opencode &>/dev/null; then
    info "opencode already installed"
  else
    info "Installing opencode..."
    curl -fsSL https://opencode.ai/install | bash
  fi
fi

if skip pi; then
  warn "pi"
else
  if command -v pi &>/dev/null; then
    info "pi already installed"
  else
    info "Installing pi..."
    curl -fsSL https://pi.dev/install.sh | sh
  fi
  export NVM_DIR="$HOME/.nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  PI_EXTENSIONS=(
    npm:pi-provider-litellm
    npm:pi-powerline-footer
    npm:pi-mcp-adapter
    npm:pi-web-access
    npm:@juicesharp/rpiv-todo
    npm:@juicesharp/rpiv-ask-user-question
    npm:@ff-labs/pi-fff
    npm:pi-subagents
    npm:pi-btw
  )
  INSTALLED_EXTENSIONS=$(pi list 2>/dev/null || true)
  for ext in "${PI_EXTENSIONS[@]}"; do
    if echo "$INSTALLED_EXTENSIONS" | grep -q "$ext"; then
      info "pi extension $ext already installed"
    else
      info "Installing pi extension $ext..."
      pi install "$ext"
    fi
  done
fi

if skip herdr; then
  warn "herdr"
else
  if command -v herdr &>/dev/null; then
    info "herdr already installed"
  else
    info "Installing herdr..."
    curl -fsSL https://herdr.dev/install.sh | sh
  fi
fi

if skip just; then
  warn "just"
else
  if command -v just &>/dev/null; then
    info "just already installed"
  else
    info "Installing just..."
    brew install just
  fi
fi

if skip txs; then
  warn "txs"
else
  if command -v txs &>/dev/null; then
    info "txs already installed"
  else
    info "Installing txs..."
    curl -fsSL https://raw.githubusercontent.com/emrecanaltinsoy/txs/main/install.sh | bash
  fi
fi

# ── tmux extras ───────────────────────────────────────────────────────────────
if skip oh_my_tmux; then
  warn "oh_my_tmux"
else
  if [[ -d "$HOME/oh-my-tmux" ]]; then
    info "oh-my-tmux already installed"
  else
    info "Installing oh-my-tmux..."
    git clone --single-branch https://github.com/gpakosz/.tmux.git "$HOME/oh-my-tmux"
    mkdir -p "$HOME/.config/tmux"
    ln -sf "$HOME/oh-my-tmux/.tmux.conf" "$HOME/.config/tmux/tmux.conf"
  fi
fi

if skip tmuxifier; then
  warn "tmuxifier"
else
  if [[ -d "$HOME/.tmuxifier" ]]; then
    info "tmuxifier already installed"
  else
    info "Installing tmuxifier..."
    git clone https://github.com/jimeh/tmuxifier.git "$HOME/.tmuxifier"
  fi
fi

# ── stow dotfiles ───────────────────────────────────────────────────────────
if skip dotfiles; then
  warn "dotfiles"
else
  brew_install stow

  # Repo root is one level up from this script (scripts/setup-macos.sh)
  DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"

  # fastfetch skipped — config has hardcoded Ubuntu logo
  STOW_DIRS=(
    bash git lazygit nvim opencode pi
    starship tmux topgrade txs herdr
    wezterm yazi zellij zsh
  )

  for dir in "${STOW_DIRS[@]}"; do
    if [[ -d "$DOTFILES_DIR/$dir" ]]; then
      info "Stowing $dir..."
      stow --adopt --dir="$DOTFILES_DIR" --target="$HOME" --restow "$dir"
    else
      warn "dotfiles/$dir not found, skipping"
    fi
  done
fi

# ── done ──────────────────────────────────────────────────────────────────────
echo
echo -e "${GREEN}✓ Setup complete!${RESET}"
echo
echo "Next steps:"
echo "  1. source ~/.zshrc"
echo "  2. gh auth login"
