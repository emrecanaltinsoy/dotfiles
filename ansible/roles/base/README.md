Base
====

Installs base system dependencies including apt packages, Rust (via rustup), and uv (Python package manager).

Requirements
------------

- Ansible 2.9 or higher
- Ubuntu/Debian-based system
- sudo privileges

Role Variables
--------------

No variables required.

Dependencies
------------

None. This role should be run first after discover.

Tasks
-----

### 1. Add git-core PPA

Adds the official git-core PPA for the latest Git version.

### 2. Update and Install APT Dependencies

Installs essential packages:

- **Build tools**: build-essential
- **Utilities**: curl, wget, unzip, zip, jq, socat
- **Version control**: git, stow
- **Security**: gnupg, gpg, gpg-agent, keychain, openssh-client
- **Shell**: zsh, fzf
- **Python**: python3, python3-pip, python3-venv, python3-wheel, python3-dev
- **Other**: neofetch, software-properties-common

### 3. Install Rust

Installs Rust via rustup for cargo package installation.

### 4. Install uv

Installs uv, a fast Python package manager.

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - base
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
