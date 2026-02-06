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

Installs the following Rust-based CLI tools via `cargo install`:

**Debian/Ubuntu:**

| Package | Binary | Description |
|---------|--------|-------------|
| exa | exa | Modern ls replacement ( installs `eza` on Arch) |
| git-delta | delta | Syntax-highlighting pager for git |
| rm-improved | rip | Safe rm alternative |
| topgrade | topgrade | System upgrade tool |
| xcp | xcp | Extended cp command |
| zoxide | zoxide | Smarter cd command |

**RedHat/Rocky/Fedora:**

| Package | Binary | Description |
|---------|--------|-------------|
| exa | exa | Modern ls replacement (installs `eza` on Arch) |
| rm-improved | rip | Safe rm alternative |
| topgrade | topgrade | System upgrade tool |
| xcp | xcp | Extended cp command |
| zoxide | zoxide | Smarter cd command |

**Note:** git-delta is installed via dnf on RedHat systems, not via cargo.

### Platform Notes

**Arch Linux:** This role is skipped entirely on Arch Linux. All packages listed above are installed via pacman/AUR in the `tools` role instead. Arch installs `eza` (the maintained fork of exa) rather than the unmaintained `exa`.

### Other Rust Tools (Installed via System Package Managers)

The following Rust-based tools are installed via apt/dnf/pacman in other roles, not via cargo:

| Tool | Role | Installation Method |
|------|------|---------------------|
| alacritty | tools | apt/dnf/pacman |
| bat | base | apt/dnf/pacman |
| fd-find | base | apt/dnf/pacman |
| ripgrep | base | apt/dnf/pacman |

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
