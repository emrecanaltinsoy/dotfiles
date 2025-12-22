Docker / Podman
===============

Installs container runtime and configures it for the current user. On Debian-based systems, installs Docker Engine. On RedHat-based systems, installs Podman with Docker CLI compatibility.

Requirements
------------

- Ansible 2.9 or higher
- Debian-based (Ubuntu, Debian) or RedHat-based (Rocky Linux, RHEL, Fedora) system
- sudo privileges
- curl installed on the target system (Debian only)

Role Variables
--------------

No variables need to be configured. The role automatically detects the current user and OS family.

Dependencies
------------

None.

Tasks
-----

### 1. Install Container Runtime

**Debian-based systems (Docker):**
- Downloads and runs the official Docker installation script from `https://get.docker.com`
- Creates the `docker` group if it doesn't exist
- Adds the current user to the `docker` group (allows running Docker without sudo)

**RedHat-based systems (Podman):**
- Installs `podman` and `podman-docker` packages via dnf
- `podman-docker` provides Docker CLI compatibility (docker commands work with Podman)
- Podman runs rootless by default, no group configuration needed

### 2. Start Container Service

**Debian-based systems:**
- Enables the Docker service to start on boot
- Starts the Docker daemon

**RedHat-based systems:**
- Enables the Podman socket for Docker API compatibility
- Starts the Podman socket service

Post-Installation
-----------------

**Debian (Docker):**
After running this role, you may need to log out and log back in for the docker group membership to take effect. Alternatively, run:

```bash
newgrp docker
```

**RedHat (Podman):**
No additional steps required. Podman runs rootless by default.

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
