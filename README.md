# Dotfiles with Ansible Deployment

Automated development environment setup for Linux using Ansible. Supports Debian-based (Ubuntu, Debian) and RedHat-based (Rocky Linux, CentOS, Fedora) systems, including Windows Subsystem for Linux (WSL).

## What Gets Installed

| Category | Tools |
|----------|-------|
| **Container** | Docker (Debian) / Podman (RedHat) |
| **Version Control** | Git (with SSH/GPG signing), GitHub CLI, Lazygit |
| **Shell** | Zsh, Oh-My-Zsh, Starship prompt, fzf |
| **Editor** | Neovim |
| **Terminal** | Tmux, Oh-My-Tmux, Tmuxifier, Alacritty |
| **Cloud/IaC** | AWS CLI, Terraform, SOPS |
| **Languages** | Rust (rustup), Python (uv), Node.js (NVM) |
| **CLI Tools** | bat, exa, fd, ripgrep, delta, procs, rip, tokei, topgrade, xcp, xh, zoxide |
| **Other** | OpenCode, fastfetch/neofetch, Stow |

## Quick Start

### Option 1: Using uv (Recommended)

```bash
# Install git and uv
sudo apt-get update && sudo apt-get install -y git  # Debian/Ubuntu
# or: sudo dnf install -y git                       # Fedora/RHEL

curl -LsSf https://astral.sh/uv/install.sh | sh

# Clone the repository
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/dotfiles && cd dotfiles/ansible/

# Install dependencies
uv sync

# Create encrypted secrets file
EDITOR=nano uv run ansible-vault create secrets.yml

# Run the setup playbook
uv run ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass
```

### Option 2: Using System Ansible

#### Ubuntu/Debian

```bash
# Install Ansible
sudo apt-get update && sudo apt-get install -y git python3 python3-pip ansible

# Clone the repository
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/dotfiles && cd dotfiles/ansible/

# Create encrypted secrets file
EDITOR=nano ansible-vault create secrets.yml

# Run the setup playbook
ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass
```

#### Rocky Linux/RHEL/Fedora

```bash
# Install Ansible
sudo dnf install -y git python3 python3-pip ansible

# Clone and run setup (same as above)
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/dotfiles && cd dotfiles/ansible/
EDITOR=nano ansible-vault create secrets.yml
ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass
```

### Secrets Configuration

The `secrets.yml` file should contain:

```yaml
user_email: "email"
user_fullname: "Firstname Lastname"
user_passphrase: "passphrase_to_generate_new_gpg_key"
```

### Post-Install

After deployment, logout and login again to use Zsh as your default shell, then:

```bash
source ${HOME}/.zshrc
```

## Ansible Roles

| Role | Description |
|------|-------------|
| [discover](ansible/roles/discover/README.md) | Environment detection and configuration validation |
| [base](ansible/roles/base/README.md) | System dependencies, Rust, and uv |
| [git](ansible/roles/git/README.md) | Git configuration with GPG signing and SSH |
| [shell](ansible/roles/shell/README.md) | Zsh with Oh-My-Zsh and plugins |
| [github](ansible/roles/github/README.md) | GitHub CLI installation |
| [cargo](ansible/roles/cargo/README.md) | Rust/Cargo CLI tools |
| [tools](ansible/roles/tools/README.md) | Developer tools (lazygit, neovim, tmux, etc.) |
| [dotfiles](ansible/roles/dotfiles/README.md) | Stow dotfiles to home directory |
| [docker](ansible/roles/docker/README.md) | Docker (Debian) or Podman (RedHat) installation |
| [common](ansible/roles/common/README.md) | Shared tasks (zshrc sourcing) |

## Repository Structure

```
dotfiles/
├── ansible/            # Ansible playbooks and roles
│   ├── roles/          # Modular roles for each component
│   ├── molecule/       # Molecule test configuration
│   ├── setup.yml       # Main deployment playbook
│   └── bootstrap.yml   # Bootstrap for remote servers
├── alacritty/          # Alacritty terminal config
├── bash/               # Bash shell configuration
├── git/                # Git configuration
├── lazygit/            # Lazygit configuration
├── neofetch/           # Neofetch config
├── nvim/               # Neovim configuration
├── opencode/           # OpenCode configuration
├── package-selector/   # Interactive package installer
├── starship/           # Starship prompt config
├── tmux/               # Tmux configuration
├── topgrade/           # Topgrade config
├── zellij/             # Zellij config
└── zsh/                # Zsh shell configuration
```

## Testing with Molecule

The Ansible roles are tested using [Molecule](https://molecule.readthedocs.io/):

```bash
cd ansible
uv sync  # Install dependencies

# Run full test suite on Ubuntu 24.04 (default)
uv run molecule test

# Test on other distributions
MOLECULE_IMAGE=geerlingguy/docker-ubuntu2204-ansible uv run molecule test  # Ubuntu 22.04
MOLECULE_IMAGE=geerlingguy/docker-rockylinux9-ansible uv run molecule test # Rocky Linux 9
MOLECULE_IMAGE=geerlingguy/docker-fedora41-ansible uv run molecule test    # Fedora 41
MOLECULE_IMAGE=geerlingguy/docker-fedora43-ansible uv run molecule test    # Fedora 43
```

## Remote Server Deployment

Deploy to remote servers by configuring the inventory file:

```ini
# ansible/hosts
[local]
localhost ansible_host=127.0.0.1 ansible_connection=local

[redhat]
fedora-wsl ansible_host=192.168.1.100 ansible_user=ubuntu

[redhat:vars]
ansible_ssh_private_key_file=~/.ssh/id_ed25519

[workstations:children]
local
redhat
```

```bash
# Copy SSH key first
ssh-copy-id -i ~/.ssh/id_ed25519.pub ubuntu@192.168.1.100

# Bootstrap if Python is not installed
ansible-playbook bootstrap.yml -i hosts --ask-become-pass

# Deploy to all workstations
ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass

# Deploy to specific group
ansible-playbook setup.yml -i hosts -l redhat --ask-become-pass --ask-vault-pass
```

## WSL Setup

For Windows Subsystem for Linux setup instructions, see [ansible/README.md](ansible/README.md#wsl-setup-windows).

## Package Selector Tool

An interactive TUI tool for selecting and installing CLI tools:

```bash
cd package-selector
uv run python main.py
```

See [package-selector/README.md](package-selector/README.md) for details.

## License

This repository contains personal configurations. Feel free to use any parts that are helpful for your own setup.
