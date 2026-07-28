Discover
========

Gathers information about the current environment and validates required configuration. This role should run before other roles to detect the environment and ensure all required variables are defined.

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, RHEL, Fedora) system

Role Variables
--------------

This role validates that the following variables are defined (typically in `env.yml`):

| Variable | Description |
|----------|-------------|
| `user_email` | User's email address (required) |
| `user_fullname` | User's full name (required) |

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

### 2. Environment Configuration Validation

Validates that required variables are defined:

- `user_email`
- `user_fullname`

Fails with descriptive error messages if any required variable is missing.

### 3. Configure Bashrc

Creates the `~/.bashrc.d` directory structure with proper permissions (0755) for modular bash configuration.

Example Playbook
----------------

```yaml
- hosts: localhost
  vars_files:
    - env.yml
  roles:
    - discover  # Run first to detect environment
    - base
    - git
    - shell
```

Example `env.yml`:

```yaml
user_email: "john.doe@example.com"
user_fullname: "John Doe"
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
