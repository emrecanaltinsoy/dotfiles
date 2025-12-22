Dotfiles
========

Symlinks dotfile directories to home using GNU Stow.

Requirements
------------

- Ansible 2.9 or higher
- GNU Stow installed (via base role)

Role Variables
--------------

| Variable | Default | Description |
|----------|---------|-------------|
| `skip_stow` | false | Set to true to skip stow tasks (useful for testing) |

Dependencies
------------

- base

Tasks
-----

### Stow Dotfiles

Symlinks the following dotfile directories to the home directory:

- alacrity
- bash
- git
- lazygit
- neofetch
- nvim
- opencode
- starship
- tmux
- topgrade
- zellij
- zsh

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - dotfiles
```

Skip stow in tests:

```yaml
- hosts: localhost
  vars:
    skip_stow: true
  roles:
    - dotfiles
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
