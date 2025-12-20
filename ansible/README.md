# Ansible Deployment for Ubuntu

Automated development environment setup for Ubuntu using Ansible. Works on both native Ubuntu installations and Windows Subsystem for Linux (WSL).

## What Gets Installed

| Category | Tools |
|----------|-------|
| **Container** | Docker |
| **Version Control** | Git (with SSH/GPG signing), GitHub CLI, Lazygit |
| **Shell** | Zsh, Oh-My-Zsh, Starship prompt, fzf |
| **Editor** | Neovim |
| **Terminal** | Tmux, Oh-My-Tmux, Tmuxifier, Alacritty |
| **Cloud/IaC** | AWS CLI, Terraform, SOPS |
| **Languages** | Rust (rustup), Python (uv), Node.js (NVM) |
| **CLI Tools** | bat, exa, fd, ripgrep, delta, procs, rip, tokei, topgrade, xcp, xh, zoxide |
| **Other** | OpenCode, neofetch, Stow |

## Roles

| Role | Description |
|------|-------------|
| [discover](roles/discover/README.md) | Environment detection and configuration validation |
| [devenv](roles/devenv/README.md) | Development tools, shell, and dotfiles configuration |
| [docker](roles/docker/README.md) | Docker Engine installation |
| [common](roles/common/README.md) | Shared tasks (zshrc sourcing) |

## Quick Start (Ubuntu)

### Install Ansible dependencies

```Shell
sudo apt-get update && sudo apt-get install -y git python3 python3-pip ansible
```

### Clone the repository

```Shell
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/stow-dotfiles && cd ${HOME}/stow-dotfiles/ansible/
```

### Configure Secrets

Create an encrypted vault file containing your secrets:

```Shell
cd ${HOME}/stow-dotfiles/ansible/ && EDITOR=<EDITOR_OF_CHOICE> ansible-vault create ${HOME}/stow-dotfiles/ansible/secrets.yml
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
cd ${HOME}/stow-dotfiles/ansible/ && ansible-playbook site.yml -i hosts --ask-become-pass --ask-vault-pass
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

## Author

Emrecan Altinsoy
