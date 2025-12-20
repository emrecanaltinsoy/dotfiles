# Dotfiles with GNU Stow

This repository contains my personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager that makes it easy to organize and deploy configuration files.

## What is GNU Stow?

GNU Stow is a tool that creates symbolic links from a central directory to your home directory (or any target directory). This allows you to keep all your dotfiles organized in one place while having them appear in their expected locations.

## Repository Structure

Each directory in this repository represents a "package" that can be installed independently:

```
stow-dotfiles/
├── alacritty/          # Alacritty terminal emulator config
├── bash/               # Bash shell configuration
├── git/                # Git configuration and templates
├── lazygit/            # Lazygit configuration
├── neofetch/           # Neofetch system info config
├── nvim/               # Neovim configuration
├── opencode/           # OpenCode configuration
├── package-selector/   # Interactive package installer (not stowed)
├── starship/           # Starship prompt config
├── tmux/               # Tmux configuration and layouts
├── topgrade/           # Topgrade system updater config
├── zellij/             # Zellij terminal multiplexer config
└── zsh/                # Zsh shell configuration
```

## Installation

### Prerequisites

Make sure you have GNU Stow installed:

```bash
# Ubuntu/Debian
sudo apt install stow

# macOS with Homebrew
brew install stow

# Arch Linux
sudo pacman -S stow
```

### Setup Instructions

1. **Clone the repository to your home directory:**
   ```bash
   cd ~
   git clone https://github.com/your-username/stow-dotfiles.git
   cd stow-dotfiles
   ```

2. **Install all packages at once:**
   ```bash
   stow */
   ```

3. **Or install specific packages individually:**
   ```bash
   # Install only Neovim config
   stow nvim
   
   # Install Zsh and Starship configs
   stow zsh starship
   
   # Install terminal-related configs
   stow alacritty tmux
   ```

### Examples

**Install everything:**
```bash
cd ~/stow-dotfiles
stow */
```

**Install only shell-related configurations:**
```bash
cd ~/stow-dotfiles
stow zsh starship
```

**Install development tools:**
```bash
cd ~/stow-dotfiles
stow nvim lazygit opencode
```

## Package Selector Tool

This repository includes an interactive package installer tool in the `package-selector/` directory. It provides a TUI (Text User Interface) for selecting and installing common CLI tools and development packages.

```bash
cd package-selector
uv run python main.py
```

See [package-selector/README.md](package-selector/README.md) for detailed documentation.

## Automated Setup with Ansible

For a complete automated development environment setup, use the Ansible playbooks in the `ansible/` directory. This will install all required tools, configure Git with GPG signing, set up Zsh with Oh-My-Zsh, and stow all dotfiles automatically.

### Quick Start

```bash
# Install Ansible
sudo apt-get update && sudo apt-get install -y git python3 python3-pip ansible

# Clone and enter the repository
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/stow-dotfiles && cd stow-dotfiles/ansible/

# Create encrypted secrets file
EDITOR=nano ansible-vault create secrets.yml

# Run the setup playbook
ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass
```

See [ansible/README.md](ansible/README.md) for detailed documentation including:
- Remote server deployment
- WSL setup instructions
- Available roles and what they install

## How It Works

When you run `stow nvim`, Stow will create symbolic links like:
- `~/.config/nvim/` → `~/stow-dotfiles/nvim/.config/nvim/`

This way, your actual config files stay organized in the repository, but applications can find them in their expected locations.

## Managing Dotfiles

### Adding New Configurations

1. Create a new directory for the application
2. Recreate the directory structure as it should appear in your home directory
3. Place your config files in the appropriate subdirectories
4. Run `stow <package-name>` to install

### Removing Configurations

To remove a package's symlinks:
```bash
stow -D <package-name>
```

### Updating Configurations

Since the files are symlinked, any changes you make to the actual config files will automatically be reflected in the repository. Just commit and push your changes:

```bash
git add .
git commit -m "Update nvim configuration"
git push
```

## Troubleshooting

**Conflict with existing files:**
If you have existing config files, Stow will warn you about conflicts. You'll need to either:
- Remove the existing files, or
- Move them to backup locations

**Example of handling conflicts:**
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Then install the package
stow nvim
```

## License

This repository contains personal configurations. Feel free to use any parts that are helpful for your own setup.