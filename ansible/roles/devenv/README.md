Devenv
======

Configures a complete development environment including Git with GPG commit signing, SSH keys, Zsh shell with Oh-My-Zsh, GitHub CLI, and various developer tools.

Requirements
------------

- Ansible 2.1 or higher
- Ubuntu/Debian-based system (uses apt)
- sudo privileges for package installation

Role Variables
--------------

The following variables must be provided:

| Variable | Description |
|----------|-------------|
| `user_fullname` | Full name for Git configuration and GPG key |
| `user_email` | Email for Git configuration, GPG key, and SSH key |
| `user_passphrase` | Passphrase for GPG key generation |

The following Ansible facts are used automatically:

- `ansible_user_dir`: Home directory of the current user
- `ansible_user_id`: Current username
- `IS_WSL`: Boolean flag to detect WSL environment (used to skip certain packages)

Dependencies
------------

None.

Tasks
-----

### 1. Install Dependencies

Adds git-core PPA and installs essential packages:

- **Build tools**: build-essential
- **Utilities**: curl, wget, unzip, zip, jq, socat
- **Version control**: git, stow
- **Security**: gnupg, gpg, gpg-agent, keychain, openssh-client
- **Shell**: zsh, fzf
- **Python**: python3, python3-pip, python3-venv, python3-wheel, python3-dev
- **Other**: neofetch, software-properties-common

Also installs:
- **Rust** via rustup
- **uv** (Python package manager)

### 2. Configure GPG

- Generates a 4096-bit RSA GPG key pair if not exists
- Configures gpg-agent with extended cache TTL (400 days)
- Exports public key for GitHub CLI upload
- Configures Git to use GPG key for signing commits and tags

### 3. Configure SSH

- Generates ED25519 SSH key if not exists
- Sets up keychain for SSH agent management

### 4. Configure Git

Sets global Git configuration:
- `user.name` and `user.email`
- `core.autocrlf` set to input
- GPG signing enabled for commits and tags

### 5. Configure Zsh

- Installs Oh-My-Zsh
- Installs plugins:
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - k (directory listing)
  - zsh-fzf-history-search
- Sets Zsh as default shell

### 6. Install GitHub CLI

- Installs `gh` CLI from official repository
- Configures authentication token export script for:
  - `GH_AUTH_TOKEN`
  - `GH_ENTERPRISE_TOKEN`
  - `GALAXY_GIT_TOKEN`
- Automatically uploads SSH and GPG keys to GitHub on first authentication

### 7. Install Cargo Packages

Installs the following Rust-based CLI tools via cargo:

| Package | Binary | Description |
|---------|--------|-------------|
| alacritty | alacritty | GPU-accelerated terminal (skipped on WSL) |
| bat | bat | Cat clone with syntax highlighting |
| exa | exa | Modern ls replacement |
| fd-find | fd | Fast find alternative |
| git-delta | delta | Syntax-highlighting pager for git |
| procs | procs | Modern ps replacement |
| rm-improved | rip | Safe rm alternative |
| ripgrep | rg | Fast grep alternative |
| tokei | tokei | Code statistics tool |
| topgrade | topgrade | System upgrade tool |
| xcp | xcp | Extended cp command |
| xh | xh | HTTPie-like HTTP client |
| zoxide | zoxide | Smarter cd command |

### 8. Install Additional Packages

Installs non-cargo packages:

| Package | Description |
|---------|-------------|
| AWS CLI | Amazon Web Services CLI |
| lazygit | Terminal UI for git |
| Neovim | Modern vim fork |
| NVM | Node Version Manager |
| OpenCode | AI coding assistant |
| SOPS | Secrets management |
| Starship | Cross-shell prompt |
| Terraform | Infrastructure as code |
| tmux | Terminal multiplexer |
| Oh-My-Tmux | Tmux configuration framework |
| tmuxifier | Tmux session manager |

### 9. Stow Dotfiles

Symlinks dotfile directories to home using GNU Stow:

- alacrity
- bash
- git
- lazygit
- neofetch
- nvim
- opencode
- starship
- tmux
- topgrade
- zellij
- zsh

Files
-----

- `files/gh_auth_token.bashrc`: GitHub CLI authentication and key export script
- `files/ssh_keychain.bashrc`: SSH keychain initialization script

Templates
---------

- `templates/gpg-agent.conf.j2`: GPG agent configuration
- `templates/gpg-key-gen.conf.j2`: GPG key generation batch file

Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    user_fullname: "John Doe"
    user_email: "john.doe@example.com"
    user_passphrase: "your-secure-passphrase"
  roles:
    - devenv
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
