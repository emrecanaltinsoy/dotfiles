Tools
=====

Installs developer tools that are not cargo-based.

Requirements
------------

- Ansible 2.9 or higher
- Ubuntu/Debian-based system
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

Tasks
-----

### Installed Tools

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
