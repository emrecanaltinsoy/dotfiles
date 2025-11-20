# Dotfiles with GNU Stow

This repository contains my personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager that makes it easy to organize and deploy configuration files.

## What is GNU Stow?

GNU Stow is a tool that creates symbolic links from a central directory to your home directory (or any target directory). This allows you to keep all your dotfiles organized in one place while having them appear in their expected locations.

## Repository Structure

Each directory in this repository represents a "package" that can be installed independently:

```
stow-dotfiles/
├── alacritty/          # Alacritty terminal emulator config
├── lazygit/            # Lazygit configuration
├── neofetch/           # Neofetch system info config
├── nvim/               # Neovim configuration
├── opencode/           # OpenCode configuration
├── starship/           # Starship prompt config
├── tmux/               # Tmux configuration and layouts
├── topgrade/           # Topgrade system updater config
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