GitHub
======

Installs and configures GitHub CLI (gh).

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, RHEL, Fedora) system
- sudo privileges

Role Variables
--------------

No variables required.

Dependencies
------------

- git

File Structure
--------------

```
tasks/
├── main.yml      # OS detection and include
├── Debian.yml    # GitHub CLI installation via apt
└── RedHat.yml    # GitHub CLI installation via dnf
```

Tasks
-----

### Install GitHub CLI

**Debian-based systems:**
- Adds the official GitHub CLI apt repository with GPG key
- Installs `gh` CLI via apt

**RedHat-based systems:**
- Adds the official GitHub CLI dnf repository
- Installs `gh` CLI via dnf

### Configure Authentication

Authentication token export script is copied via setup.yml post_tasks for:
- `GH_AUTH_TOKEN`
- `GH_ENTERPRISE_TOKEN`
- `GALAXY_GIT_TOKEN`

Automatically uploads SSH and GPG keys to GitHub on first authentication.

Files
-----

- `files/gh_auth_token.bashrc`: GitHub CLI authentication and key export script

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - github
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
