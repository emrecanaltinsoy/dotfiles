GitHub
======

Installs and configures GitHub CLI (gh).

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

- git

Tasks
-----

### 1. Install GitHub CLI

Installs `gh` CLI from the official GitHub repository.

### 2. Configure Authentication

Configures authentication token export script for:
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
