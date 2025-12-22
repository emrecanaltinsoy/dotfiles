Common
======

Contains common tasks that are shared across other roles. Currently handles sourcing the `.zshrc` configuration file from its correct location.

Requirements
------------

- Ansible 2.9 or higher
- Zsh shell installed on the target system

Role Variables
--------------

This role uses the following Ansible facts:

- `ansible_user_dir`: The home directory of the current user (automatically detected)

No additional variables need to be configured.

Dependencies
------------

None.

Tasks
-----

### Source .zshrc

Automatically detects and sources the `.zshrc` file from one of the following locations:

1. `~/.zshrc` (home directory - checked first)
2. `~/.config/zsh/.zshrc` (XDG config directory - fallback)

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - common
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
