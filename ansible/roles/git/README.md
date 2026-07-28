Git
===

Configures Git with SSH key management.

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, RHEL, Fedora) system
- sudo privileges

Role Variables
--------------

The following variables must be provided:

| Variable | Description |
|----------|-------------|
| `user_fullname` | Full name for Git configuration |
| `user_email` | Email for Git configuration and SSH key |

Optional variables with defaults:

| Variable | Default | Description |
|----------|---------|-------------|
| `ssh_key_name` | `id_ed25519` | SSH key filename (without path) |

Dependencies
------------

- base

Tasks
-----

### 1. Configure SSH

- Generates ED25519 SSH key if not exists (configurable via `ssh_key_name`)
- Sets up keychain for SSH agent management

### 2. Configure Git

Sets global Git configuration:
- `user.name` and `user.email`
- `core.autocrlf` set to input

Files
-----

(None - all scripts moved to templates)

Templates
---------

- `templates/ssh_keychain.bashrc.j2`: SSH keychain initialization script

Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    user_fullname: "John Doe"
    user_email: "john.doe@example.com"
  roles:
    - git
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
