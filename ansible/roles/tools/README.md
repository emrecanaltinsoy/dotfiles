Tools
=====

Installs developer tools that are not cargo-based.

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, RHEL, Fedora) system
- sudo privileges

Role Variables
--------------

| Variable | Default | Description |
|----------|---------|-------------|
| `lazygit_version` | 0.44.1 | Lazygit version to install |
| `nvm_version` | 0.40.1 | NVM version to install |
| `sops_version` | 3.9.0 | SOPS version to install |

Dependencies
------------

- base

File Structure
--------------

```
tasks/
├── main.yml       # Main entry point, includes OS-specific tasks
├── Archlinux.yml  # Arch Linux: pacman packages and AUR helpers
├── Debian.yml     # Debian/Ubuntu: Terraform (apt), tmux (apt)
└── RedHat.yml     # RedHat/Rocky/Fedora: Terraform (dnf), tmux (dnf)
```

Tasks
-----

### Installed Tools

| Package | Description | Installation Method |
|---------|-------------|---------------------|
| AWS CLI | Amazon Web Services CLI | Official installer (all platforms) |
| just | Command runner | `uv tool install rust-just` (all platforms) |
| lazygit | Terminal UI for git | GitHub release binary (all platforms) |
| Neovim | Modern vim fork | GitHub release binary (all platforms) |
| NVM | Node Version Manager | Official install script (all platforms) |
| Node.js LTS | JavaScript runtime (installed via NVM if no version present) | `nvm install --lts` (all platforms) |
| OpenCode | AI coding assistant | Official installer (all platforms) |
| Pi | AI coding agent | Official installer (all platforms) |
| SOPS | Secrets management | GitHub release binary (all platforms) |
| Starship | Cross-shell prompt | Official installer (all platforms) |
| Terraform | Infrastructure as code | apt (Debian) / dnf (RedHat) |
| tmux | Terminal multiplexer | apt (Debian) / dnf (RedHat) |
| Oh-My-Tmux | Tmux configuration framework | Git clone (all platforms) |
| tmuxifier | Tmux session manager | Git clone (all platforms) |
| WezTerm | GPU-accelerated terminal | pacman (Arch) / apt fury repo (Debian) / Copr (RedHat) |
| wl-clipboard | Wayland clipboard provider for Neovim | pacman (Arch) / apt (Debian) / dnf (RedHat) |
| yazi | Terminal file manager | AUR (Arch) / cargo (Debian, RedHat) |

### Platform-Specific Notes

**Terraform:**
- Debian: Installed from HashiCorp apt repository
- RedHat: Installed from HashiCorp dnf repository

**tmux:**
- Debian: Installed via apt
- RedHat: Installed via dnf

**WezTerm:**
- Arch: Installed via pacman
- Debian: Installed from `apt.fury.io/wez` apt repository
- RedHat: Installed from `wez/wezterm` Copr repository
- Skipped on WSL

**wl-clipboard:**
- Installed on all platforms via native package manager
- Provides Wayland clipboard support for Neovim (`unnamedplus`)
- Skipped on WSL

**yazi:**
- Arch: Installed via AUR helper (yay/paru)
- Debian/RedHat: Installed via `cargo install yazi-fm` (in the `cargo` role)

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - tools
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
