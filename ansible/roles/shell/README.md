Shell
=====

Installs and configures Zsh shell with Oh-My-Zsh and plugins.

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, RHEL, Fedora) system

Role Variables
--------------

No variables required.

Dependencies
------------

- base

Tasks
-----

### 1. Install Oh-My-Zsh

Installs Oh-My-Zsh framework for Zsh configuration.

### 2. Install Plugins

Installs the following Oh-My-Zsh plugins:
- zsh-syntax-highlighting
- zsh-autosuggestions
- k (directory listing)
- zsh-fzf-history-search

### 3. Set Default Shell

Sets Zsh as the default shell for the current user.

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - shell
```

Post-Installation
-----------------

After running this role, logout and login again for the shell change to take effect.

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
