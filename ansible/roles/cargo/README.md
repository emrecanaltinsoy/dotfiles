Cargo
=====

Installs Rust-based CLI tools via cargo.

Requirements
------------

- Ansible 2.9 or higher
- Rust/Cargo installed (via base role)

Role Variables
--------------

No variables required. The list of packages is defined in the tasks.

Dependencies
------------

- base

Tasks
-----

### Install Cargo Packages

Installs the following Rust-based CLI tools:

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

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - cargo
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
