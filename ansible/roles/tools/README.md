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
├── main.yml      # Main entry point, includes OS-specific tasks
├── Debian.yml    # Debian/Ubuntu: Terraform (apt), tmux (apt)
└── RedHat.yml    # RedHat/Rocky/Fedora: Terraform (dnf), tmux (dnf)
```

Tasks
-----

### Installed Tools

| Package | Description | Installation Method |
|---------|-------------|---------------------|
| AWS CLI | Amazon Web Services CLI | Official installer (all platforms) |
| lazygit | Terminal UI for git | GitHub release binary (all platforms) |
| Neovim | Modern vim fork | GitHub release binary (all platforms) |
| NVM | Node Version Manager | Official install script (all platforms) |
| OpenCode | AI coding assistant | Official installer (all platforms) |
| SOPS | Secrets management | GitHub release binary (all platforms) |
| Starship | Cross-shell prompt | Official installer (all platforms) |
| Terraform | Infrastructure as code | apt (Debian) / dnf (RedHat) |
| tmux | Terminal multiplexer | apt (Debian) / dnf (RedHat) |
| Oh-My-Tmux | Tmux configuration framework | Git clone (all platforms) |
| tmuxifier | Tmux session manager | Git clone (all platforms) |

### Platform-Specific Notes

**Terraform:**
- Debian: Installed from HashiCorp apt repository
- RedHat: Installed from HashiCorp dnf repository

**tmux:**
- Debian: Installed via apt
- RedHat: Installed via dnf

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
