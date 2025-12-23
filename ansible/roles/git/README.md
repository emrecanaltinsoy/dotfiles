Git
===

Configures Git with GPG commit signing and SSH key management.

Requirements
------------

- Ansible 2.9 or higher
- Ubuntu/Debian-based system
- sudo privileges

Role Variables
--------------

The following variables must be provided:

| Variable | Description |
|----------|-------------|
| `user_fullname` | Full name for Git configuration and GPG key |
| `user_email` | Email for Git configuration, GPG key, and SSH key |
| `user_passphrase` | Passphrase for GPG key generation |

Optional variables with defaults:

| Variable | Default | Description |
|----------|---------|-------------|
| `ssh_key_name` | `id_ed25519` | SSH key filename (without path) |

Dependencies
------------

- base

Tasks
-----

### 1. Configure GPG

- Generates a 4096-bit RSA GPG key pair if not exists
- Configures gpg-agent with extended cache TTL (400 days)
- Exports public key for GitHub CLI upload
- Configures Git to use GPG key for signing commits and tags

### 2. Configure SSH

- Generates ED25519 SSH key if not exists (configurable via `ssh_key_name`)
- Sets up keychain for SSH agent management

### 3. Configure Git

Sets global Git configuration:
- `user.name` and `user.email`
- `core.autocrlf` set to input
- GPG signing enabled for commits and tags

Files
-----

(None - all scripts moved to templates)

Templates
---------

- `templates/gpg-agent.conf.j2`: GPG agent configuration
- `templates/gpg-key-gen.conf.j2`: GPG key generation batch file
- `templates/ssh_keychain.bashrc.j2`: SSH keychain initialization script

Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    user_fullname: "John Doe"
    user_email: "john.doe@example.com"
    user_passphrase: "your-secure-passphrase"
  roles:
    - git
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
