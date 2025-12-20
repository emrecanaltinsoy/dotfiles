Docker
======

Installs Docker Engine using the official installation script and configures it for the current user.

Requirements
------------

- Ansible 2.1 or higher
- Ubuntu/Debian-based system
- sudo privileges
- curl installed on the target system

Role Variables
--------------

No variables need to be configured. The role automatically detects the current user.

Dependencies
------------

None.

Tasks
-----

### 1. Install Docker

- Downloads and runs the official Docker installation script from `https://get.docker.com`
- Creates the `docker` group if it doesn't exist
- Adds the current user to the `docker` group (allows running Docker without sudo)

### 2. Start Docker Service

- Enables the Docker service to start on boot
- Starts the Docker daemon

Post-Installation
-----------------

After running this role, you may need to log out and log back in for the docker group membership to take effect. Alternatively, run:

```bash
newgrp docker
```

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
    - docker
```

License
-------

MIT

Author Information
------------------

Emrecan Altinsoy
