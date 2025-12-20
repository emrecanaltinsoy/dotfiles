# Ansible Deployment for WSL Ubuntu

We will install these distribution for WSL:

- Ubuntu 22.04 / 24.04:
  - Docker: To use docker inside WSL
  - Git: With SSH and GPG configuration for signing commit
  - Github CLI (gh)
  - ZSH: With Oh-My-Zsh and plugins (syntax-highlighting, autosuggestions, k, fzf-history-search)
  - Starship: Cross-shell prompt
  - Neovim: Modern vim editor
  - Tmux: Terminal multiplexer with Oh-My-Tmux and Tmuxifier
  - AWS CLI
  - Terraform
  - NVM: Node Version Manager
  - OpenCode: AI coding assistant
  - SOPS: Secrets management
  - Lazygit: Git TUI
  - xh: HTTP client
  - Rust: Via rustup
  - uv: Python package manager
  - fzf: Fuzzy finder
  - neofetch: System info display
  - Cargo packages: bat, exa, fd-find, git-delta, procs, rm-improved, ripgrep, tokei, topgrade, xcp, yazi, zellij, zoxide
  - Stow: For managing dotfiles symlinks

## Setup WSL (On Windows)

![Windows](./assets/icons/windows.svg)

### Download and install windows softwares

- [GPG](https://www.gnupg.org/download/index.html#binary)

> [!IMPORTANT]  
> install 'Simple installer for the current version of GnuPG'
> ![GPG download](./assets/gpg_download_simple_installer.png)
>
> ⚠️ Do not install with <b>elevated rights</b>: If installer ask you to install with elevated rights, click on "Cancel", it will install with your user right under your AppData directory.

### Install WSL

Open powerShell:

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

#### Install and launch Ubuntu 22.04

![PowerShell](./assets/icons/powershell.svg)

```PowerShell
wsl --install --web-download --distribution Ubuntu-22.04
```

You will be prompt to setup a username and a password (for sudo).

![PowerShell](./assets/icons/powershell.svg)

Open another PowerShell:

```PowerShell
wsl --set-default Ubuntu-22.04
```

## Setup on Ubuntu-22.04 (WSL)

### Open Ubuntu

![PowerShell](./assets/icons/powershell.svg)

```PowerShell
wsl --distribution Ubuntu-22.04
```

![Ubuntu](./assets/icons/ubuntu.svg)

On your Ubuntu terminal

### Install Ansible dependencies

```Shell
sudo -E apt-get update && sudo -E apt-get install -y git python3 python3-pip ansible
```

### Configure Deployment Repository

```Shell
cd ${HOME} && git clone https://github.com/emrecanaltinsoy/stow-dotfiles && cd ${HOME}/stow-dotfiles/ansible/
```

### Configure Secrets

We use a Vault file containing your (encrypted) secrets.

These secrets are used to install and maintain features for your environment:

- Generate a new GPG key for this environment, with a passphrase to sign your commits.
- Generate a new SSH key for this environment to clone the repository from Github Enteprise.
- [...]

> [!CAUTION]  
> You need to remember this **Vault password** for every deployments and future update. Save it in your personal KeyPass DB.
>
> For example you can use the same password as your sudo password

To create your encrypted vault, run the following command, a text editor will open to insert the variables below:

```Shell
cd ${HOME}/stow-dotfiles/ansible/ && EDITOR=<EDITOR_OF_CHOICE> ansible-vault create ${HOME}/stow-dotfiles/ansible/secrets.yml
```

Insert and update variables for your secrets.yml file:

```Text
user_email: "email"
user_fullname: "Firstname Lastname"
user_passphrase: "passphrase_to_generate_new_gpg_key"
```

Save (without changing the location) and close the text file editor.

### Deploy environment

```Shell
cd ${HOME}/stow-dotfiles/ansible/ && ansible-playbook site.yml -i hosts --ask-become-pass --ask-vault-pass
```

> [!NOTE]  
> BECOME password: is your sudo password
>
> Vault password: is your password for your secrets.yaml file

### Post-Install

After deployment, logout and login again (or restart WSL) to use ZSH as your default shell.

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

### Close all WSL distributions

```Shell
/mnt/c/Windows/system32/wsl.exe --shutdown
```

# How to reduce the size of the WSL Disk

The disk file grow over the time, but when you cleanup inside WSL, it can not have effect on the disk file used by WSL.
If you need to reduce space in windows, you can shrink the WSL disk file.

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

Open Diskpart

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
