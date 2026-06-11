Base
====

Installs base system dependencies including system packages, Rust (via rustup), and uv (Python package manager).

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, CentOS, Fedora) system
- sudo privileges

Role Variables
--------------

No variables required.

Dependencies
------------

None. This role should be run first after discover.

File Structure
--------------

```
tasks/
├── main.yml      # Common tasks (rustup, uv) and OS detection
├── Debian.yml    # Debian/Ubuntu specific package installation
└── RedHat.yml    # RedHat/Rocky/Fedora specific package installation
```

Tasks
-----

### 1. Add git-core PPA (Debian only)

Adds the official git-core PPA for the latest Git version.

### 2. Install System Dependencies

**Debian/Ubuntu (apt):**

- **Build tools**: build-essential
- **CLI tools**: bat, fd-find, ripgrep, zoxide
- **Utilities**: curl, wget, unzip, zip, jq, socat
- **Version control**: git, stow
- **Security**: gnupg, gpg, gpg-agent, keychain, openssh-client
- **Shell**: zsh
- **Python**: python3, python3-pip, python3-venv, python3-wheel, python3-dev
- **Other**: neofetch, software-properties-common

**RedHat/Rocky/Fedora (dnf):**

- **Build tools**: @Development Tools
- **CLI tools**: bat, fd-find, git-delta, ripgrep
- **Utilities**: gawk, wget, unzip, zip, jq, socat
- **Version control**: git, stow
- **Security**: gnupg2, keychain, openssh-clients
- **Shell**: zsh
- **Python**: python3, python3-pip, python3-devel
- **Other**: fastfetch (Fedora) / neofetch (Rocky/RHEL)

### 3. Install fzf

Downloads the fzf binary (v0.73.1) from the GitHub release, extracts it, and installs it to `/usr/bin/fzf`. This runs on all distros from `main.yml`, replacing the previous per-distro package manager installs.

### 4. Install Rust

Installs Rust via rustup for cargo package installation.

### 5. Install uv

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
