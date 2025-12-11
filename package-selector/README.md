# Package Selector

An interactive terminal-based package installer with a beautiful TUI (Text User Interface) built with [Textual](https://textual.textualize.io/).

## Overview

Package Selector provides a grid-based interface to select and install CLI tools and development packages. Navigate with vim-style keybindings or arrow keys, select packages, and run their installation scripts automatically.

## Features

- Interactive 3-column grid layout for easy navigation
- Vim-style keybindings (`h`, `j`, `k`, `l`) and arrow key support
- Toggle individual or all packages at once
- Real-time installation output streaming
- Installation summary with success/failure status

## Available Packages

| Category | Packages |
|----------|----------|
| Cloud & Infrastructure | `awscli`, `terraform`, `sops` |
| Editors & Development | `neovim`, `lazygit`, `opencode` |
| Terminal Emulators | `alacritty`, `tmux`, `zellij` |
| Shell Utilities | `starship`, `fzf`, `zoxide`, `bat`, `exa` |
| File Management | `xcp`, `rip`, `yazi`, `fd` |
| System Tools | `neofetch`, `topgrade`, `procs`, `tokei` |
| Network | `xh` |
| Search | `ripgrep` |
| Node.js | `nvm` |

## Requirements

- Python >= 3.12
- [uv](https://docs.astral.sh/uv/) (recommended) or pip

## Installation

### Using uv (Recommended)

```bash
cd package-selector
uv sync
```

### Using pip

```bash
cd package-selector
pip install -e .
```

## Usage

### Run the Package Selector

```bash
# Using uv
uv run python main.py

# Or if installed via pip
python main.py
```

### Keybindings

| Key | Action |
|-----|--------|
| `j` / `Down` | Move down |
| `k` / `Up` | Move up |
| `h` / `Left` | Move left |
| `l` / `Right` | Move right |
| `Space` | Toggle package selection |
| `a` | Toggle all packages |
| `Enter` | Confirm and install selected packages |
| `Escape` | Quit without installing |

## How It Works

1. Launch the selector with `uv run python main.py`
2. Navigate the 3-column grid to browse available packages
3. Press `Space` to select/deselect packages (or `a` to toggle all)
4. Press `Enter` to confirm and start installation
5. Each selected package runs its corresponding `scripts/install_<package>.sh` script
6. View real-time installation output and final summary

## Install Scripts

Each package has a corresponding Bash installation script in the `scripts/` directory:

```
scripts/
├── install_alacritty.sh
├── install_awscli.sh
├── install_bat.sh
├── install_exa.sh
├── install_fd.sh
├── install_fzf.sh
├── install_lazygit.sh
├── install_neofetch.sh
├── install_neovim.sh
├── install_nvm.sh
├── install_opencode.sh
├── install_procs.sh
├── install_rip.sh
├── install_ripgrep.sh
├── install_sops.sh
├── install_starship.sh
├── install_terraform.sh
├── install_tmux.sh
├── install_tokei.sh
├── install_topgrade.sh
├── install_xcp.sh
├── install_xh.sh
├── install_yazi.sh
├── install_zellij.sh
└── install_zoxide.sh
```

### Adding New Packages

1. Add the package name to the `PACKAGES` list in `main.py`
2. Create a new install script at `scripts/install_<package>.sh`
3. Make the script executable: `chmod +x scripts/install_<package>.sh`

Example install script:

```bash
#!/usr/bin/env bash

if [ ! -x "$(command -v mypackage)" ]; then
  echo "mypackage is not installed! installing now."
  # Installation commands here
else
  echo "mypackage is already installed."
fi
```

## Note

This directory is excluded from GNU Stow via `.stow-local-ignore` - it's a utility tool, not a dotfile configuration to be symlinked.
