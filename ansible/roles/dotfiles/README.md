Dotfiles
========

Symlinks dotfile directories to home using GNU Stow.

Requirements
------------

- Ansible 2.9 or higher
- GNU Stow installed (via base role)

Role Variables
--------------

None.

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

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
