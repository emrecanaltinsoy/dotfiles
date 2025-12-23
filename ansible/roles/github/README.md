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

This role uses the `ssh_key_name` variable from the `git` role to determine which SSH key to export to GitHub.

| Variable | Default | Description |
|----------|---------|-------------|
| `ssh_key_name` | `id_ed25519` | SSH key filename (set in git role) |

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

Authentication token export script is templated via setup.yml post_tasks for:
- `GH_AUTH_TOKEN`
- `GH_ENTERPRISE_TOKEN`
- `GALAXY_GIT_TOKEN`

Automatically uploads SSH and GPG keys to GitHub on first authentication.

Files
-----

(None - script moved to templates)

Templates
---------

- `templates/gh_auth_token.bashrc.j2`: GitHub CLI authentication and key export script

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
