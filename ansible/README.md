# Ansible Deployment for Linux

Automated development environment setup for Linux using Ansible. Supports Debian-based (Ubuntu, Debian) and RedHat-based (Rocky Linux, CentOS, Fedora) systems. Works on both native installations and Windows Subsystem for Linux (WSL).

## What Gets Installed

| Category | Tools |
|----------|-------|
| **Container** | Docker (Debian) / Podman (RedHat) |
| **Version Control** | Git (with SSH/GPG signing), GitHub CLI, Lazygit |
| **Shell** | Zsh, Oh-My-Zsh, Starship prompt, fzf |
| **Editor** | Neovim |
| **Terminal** | Tmux, Oh-My-Tmux, Tmuxifier, Alacritty |
| **Cloud/IaC** | AWS CLI, Terraform, SOPS |
| **Languages** | Rust (rustup), Python (uv), Node.js (NVM) |
| **CLI Tools** | bat, eza, fd, ripgrep, delta, procs, rip, tokei, topgrade, xcp, xh, zoxide |
| **Other** | OpenCode, fastfetch/neofetch, Stow |

## Roles

| Role | Description |
|------|-------------|
| [discover](roles/discover/README.md) | Environment detection and configuration validation |
| [base](roles/base/README.md) | System dependencies, Rust, and uv |
| [git](roles/git/README.md) | Git configuration with GPG signing and SSH |
| [shell](roles/shell/README.md) | Zsh with Oh-My-Zsh and plugins |
| [github](roles/github/README.md) | GitHub CLI installation |
| [cargo](roles/cargo/README.md) | Rust/Cargo CLI tools |
| [tools](roles/tools/README.md) | Developer tools (lazygit, neovim, tmux, etc.) |
| [dotfiles](roles/dotfiles/README.md) | Stow dotfiles to home directory |
| [docker](roles/docker/README.md) | Docker (Debian) or Podman (RedHat) installation |
| [common](roles/common/README.md) | Shared tasks (zshrc sourcing) |

## Quick Start (Ubuntu/Debian)

### Install Ansible dependencies

```Shell
sudo apt-get update && sudo apt-get install -y git python3 python3-pip ansible
```

### Quick Start (Rocky Linux/RHEL/Fedora)

```Shell
sudo dnf install -y git python3 python3-pip ansible
```

> [!NOTE]
> **Fedora 43+ (dnf5)**: The playbooks use shell commands instead of the `ansible.builtin.dnf` module due to libdnf5 API incompatibility. Fedora installs `fastfetch` instead of `neofetch`.

### Clone the repository

```Shell
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/dotfiles && cd ${HOME}/dotfiles/ansible/
```

### Configure Secrets

Create an encrypted vault file containing your secrets:

```Shell
cd ${HOME}/dotfiles/ansible/ && EDITOR=<EDITOR_OF_CHOICE> ansible-vault create ${HOME}/dotfiles/ansible/secrets.yml
```

Insert and update variables for your secrets.yml file:

```yaml
user_email: "email"
user_fullname: "Firstname Lastname"
user_passphrase: "passphrase_to_generate_new_gpg_key"
```

> [!CAUTION]  
> You need to remember this **Vault password** for every deployments and future updates.

### Deploy environment

```Shell
cd ${HOME}/dotfiles/ansible/ && ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass
```

> [!NOTE]  
> BECOME password: is your sudo password
>
> Vault password: is your password for your secrets.yml file

### Post-Install

After deployment, logout and login again to use Zsh as your default shell.

```Shell
source ${HOME}/.zshrc
```

> [!IMPORTANT]  
> If your Github account is not configured, you may see a request to authenticate yourself with Github:
> ![Github browser authentication](./assets/gh_auth_login_use_web_browser_one-time-code.png)
>
> Copy the code and press enter to open your web browser
>
> ![Github browser authentication](./assets/gh_auth_login_use_web_browser_one-time-code-validation.png)
>
> Once you validate the code, your generated ssh key and gpg key will be automatically copied to your Github account.

---

## WSL Setup (Windows)

If you're setting up on Windows Subsystem for Linux, follow these additional steps first.

![Windows](./assets/icons/windows.svg)

### Download and install Windows software

- [GPG](https://www.gnupg.org/download/index.html#binary)

> [!IMPORTANT]  
> Install 'Simple installer for the current version of GnuPG'
> ![GPG download](./assets/gpg_download_simple_installer.png)
>
> Do not install with **elevated rights**: If installer asks you to install with elevated rights, click on "Cancel", it will install with your user rights under your AppData directory.

### Install WSL

Open PowerShell:

![PowerShell](./assets/icons/powershell.svg)

```PowerShell
wsl --install --web-download --no-distribution
```

```PowerShell
wsl --update
```

```PowerShell
wsl.exe --set-default-version 2
```

### Install and launch Ubuntu 22.04

![PowerShell](./assets/icons/powershell.svg)

```PowerShell
wsl --install --web-download --distribution Ubuntu-22.04
```

You will be prompted to setup a username and a password (for sudo).

![PowerShell](./assets/icons/powershell.svg)

Open another PowerShell:

```PowerShell
wsl --set-default Ubuntu-22.04
```

### Open Ubuntu

![PowerShell](./assets/icons/powershell.svg)

```PowerShell
wsl --distribution Ubuntu-22.04
```

![Ubuntu](./assets/icons/ubuntu.svg)

Now follow the [Quick Start](#quick-start-ubuntu) instructions above.

### Close all WSL distributions

```Shell
/mnt/c/Windows/system32/wsl.exe --shutdown
```

---

## Running on Remote Servers

You can deploy this configuration to remote servers by modifying the inventory file.

### Inventory File (hosts)

The `hosts` file defines which machines Ansible will target. The playbooks target the all hosts by default:

```ini
[local]
localhost ansible_host=127.0.0.1 ansible_connection=local

[redhat]
fedora-wsl ansible_host=192.168.1.100 ansible_user=ubuntu

[redhat:vars]
ansible_ssh_private_key_file=~/.ssh/id_ed25519

[workstations:children]
local
redhat
```

### Common Inventory Variables

| Variable | Description |
|----------|-------------|
| `ansible_host` | IP address or hostname |
| `ansible_user` | SSH username |
| `ansible_port` | SSH port (default: 22) |
| `ansible_connection` | Connection type: `ssh`, `local`, `docker` |
| `ansible_ssh_private_key_file` | Path to SSH private key |

### Copy SSH Key to Remote Server

Before running Ansible, copy your SSH public key to the remote server:

```Shell
ssh-copy-id -i ~/.ssh/id_ed25519.pub ubuntu@192.168.1.100
```

This will prompt for the remote user's password and enable passwordless SSH authentication.

**Using a different port:**

```Shell
ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 2222 ubuntu@192.168.1.100
```

**Verify connection:**

```Shell
ssh ubuntu@192.168.1.100
```

### Bootstrap Remote Servers (if Python is not installed)

Ansible requires Python on the remote host. If Python 3 is not installed, run the bootstrap playbook first:

```Shell
ansible-playbook bootstrap.yml -i hosts --ask-become-pass
```

This uses the `raw` module which doesn't require Python on the remote host. The playbook auto-detects the package manager (apt-get or dnf).

### Deploy to Remote Servers

Run on all hosts:

```Shell
ansible-playbook setup.yml -i hosts --ask-become-pass --ask-vault-pass
```

Run on a specific group:

```Shell
ansible-playbook setup.yml -i hosts -l redhat --ask-become-pass --ask-vault-pass
```

Run on a single host:

```Shell
ansible-playbook setup.yml -i hosts -l fedora-wsl --ask-become-pass --ask-vault-pass
```

> [!NOTE]
> Make sure SSH access is configured before running the playbook.

---

## How to reduce the size of the WSL Disk

The disk file grows over time, but cleanup inside WSL does not automatically shrink the disk file.
If you need to reduce space in Windows, you can compact the WSL disk file.

![PowerShell](./assets/icons/powershell.svg)

Shutdown WSL and verify that all distributions are stopped:

```PowerShell
wsl --shutdown
wsl -l -v
```

Locate the vhdx path for your distro:

```PowerShell
"$env:USERPROFILE\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_*\LocalState\ext4.vhdx" | Resolve-Path
```

Open Diskpart:

```PowerShell
diskpart.exe
```

On the diskpart window, select the vhd by using previous path, and execute the command to compact the disk:

```
Select vdisk file="C:\Users\<USERNAME>\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_****\LocalState\ext4.vhdx"
detail vdisk
compact vdisk
detail vdisk
```

## License

MIT

## Testing

This project uses [Molecule](https://molecule.readthedocs.io/) for testing Ansible roles.

### Prerequisites

```bash
cd ansible
uv sync  # Install dependencies including molecule
```

### Running Tests

```bash
# Run full test suite on Ubuntu 24.04 (default)
uv run molecule test

# Test on Ubuntu 22.04
MOLECULE_IMAGE=geerlingguy/docker-ubuntu2204-ansible uv run molecule test

# Test on Rocky Linux 9
MOLECULE_IMAGE=geerlingguy/docker-rockylinux9-ansible uv run molecule test

# Test on Fedora 41
MOLECULE_IMAGE=geerlingguy/docker-fedora41-ansible uv run molecule test

# Test on Fedora 43
MOLECULE_IMAGE=geerlingguy/docker-fedora43-ansible uv run molecule test

# Keep instance after test for debugging
uv run molecule test --destroy=never

# Run individual steps
uv run molecule create    # Create test container
uv run molecule converge  # Run playbook
uv run molecule verify    # Run verification tests
uv run molecule destroy   # Cleanup
```

### Supported Test Platforms

| Platform | Image |
|----------|-------|
| Ubuntu 24.04 | `geerlingguy/docker-ubuntu2404-ansible` (default) |
| Ubuntu 22.04 | `geerlingguy/docker-ubuntu2204-ansible` |
| Rocky Linux 9 | `geerlingguy/docker-rockylinux9-ansible` |
| Fedora 41 | `geerlingguy/docker-fedora41-ansible` |
| Fedora 43 | `geerlingguy/docker-fedora43-ansible` |

### Test Configuration

- **Default Platform**: Ubuntu 24.04 (Docker)
- **Environment Variables**: `MOLECULE_IMAGE` to specify Docker image
- **Test variables**: Defined in `molecule/default/molecule.yml`
- **Verification**: `molecule/default/verify.yml` validates role outputs

## Author

Emrecan Altinsoy
