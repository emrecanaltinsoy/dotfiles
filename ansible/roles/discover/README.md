Discover
========

Gathers information about the current environment and validates required configuration. This role should run before other roles to detect the environment and ensure all required variables are defined.

Requirements
------------

- Ansible 2.9 or higher
- Debian-based system (Ubuntu, Debian, etc.)

Role Variables
--------------

This role validates that the following variables are defined (typically in a vault-encrypted `secrets.yml`):

| Variable | Description |
|----------|-------------|
| `user_email` | User's email address (required) |
| `user_fullname` | User's full name (required) |
| `user_passphrase` | Passphrase for GPG key (required) |

### Exported Facts

This role sets the following facts for use by other roles:

| Fact | Description |
|------|-------------|
| `IS_WSL` | Boolean indicating if running in Windows Subsystem for Linux |

Dependencies
------------

None. This role should be run first in the playbook.

Tasks
-----

### 1. Detect WSL Environment

Checks `/proc/version` for Microsoft/WSL indicators and sets the `IS_WSL` fact. This fact is used by other roles to skip or modify behavior for WSL environments.

### 2. Vault Configuration Validation

Validates that required secrets are defined:
- `user_email`
- `user_fullname`
- `user_passphrase`

Fails with descriptive error messages if any required variable is missing.

### 3. Configure Bashrc

Creates the `~/.bashrc.d` directory structure with proper permissions (0700) for modular bash configuration.

Example Playbook
----------------

```yaml
- hosts: localhost
  vars_files:
    - secrets.yml
  roles:
    - discover  # Run first to detect environment
    - devenv
    - common
```

Example `secrets.yml`:

```yaml
user_email: "john.doe@example.com"
user_fullname: "John Doe"
user_passphrase: "your-secure-passphrase"
```

Encrypt with: `ansible-vault encrypt secrets.yml`

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
