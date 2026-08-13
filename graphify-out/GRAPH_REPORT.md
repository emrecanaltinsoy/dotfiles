# Graph Report - dotfiles  (2026-08-13)

## Corpus Check
- 85 files · ~25,049 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 258 nodes · 217 edges · 73 communities (27 shown, 46 thin omitted)
- Extraction: 85% EXTRACTED · 15% INFERRED · 0% AMBIGUOUS · INFERRED: 32 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `152b849d`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- Package Selector UI
- OpenCode Agent Config
- Ansible Role Orchestration
- Ansible Base Role (Cross-Distro)
- Project Documentation & Assets
- Caveman & Ponytail Skills
- OpenCode LLM Provider Config
- Git & GitHub Ansible Roles
- Ansible Role Template
- Docker Ansible Role
- Commit Message Tools
- Dotfiles Role (GNU Stow)
- OpenCode TUI Settings
- OpenCode Graphify Plugin
- Pi Agent MCP Servers
- Ansible Role Metadata (Base/Cargo)
- Ansible Role Metadata (Git/GitHub)
- Configure Script
- Install AWS CLI Script
- Install bat Script
- Install exa Script
- Install fastfetch Script
- Install fd Script
- Install fzf Script
- Install lazygit Script
- Install Neovim Script
- Install nvm Script
- Install opencode Script
- Install procs Script
- Install rip Script
- Install ripgrep Script
- Install sops Script
- Install starship Script
- Install Terraform Script
- Install tmux Script
- Install tokei Script
- Install topgrade Script
- Install xcp Script
- Install xh Script
- Install yazi Script
- Install zellij Script
- Install zoxide Script
- Tmux Dev Template Script
- Tmux Webapp Template Script
- Find-Skills Skill
- Tmux Dev Session Layout
- Tmux Dev Window Layout
- GPG Installer Screenshot
- Ansible Template Files Readme
- Ansible Template Templates Readme
- Ansible Template Test
- Ansible Template Vars
- Discover Role Metadata
- Docker Role Metadata
- Git Role Defaults
- OpenCode README Update Command
- Ansible Dotfiles Package
- Package Selector Package

## God Nodes (most connected - your core abstractions)
1. `PackageSelector` - 17 edges
2. `Ansible Deployment Documentation` - 9 edges
3. `Tools Role Main Tasks` - 7 edges
4. `Base Role - Main Tasks (rustup, uv, fzf)` - 7 edges
5. `code-reviewer` - 5 edges
6. `GitHub CLI (gh)` - 5 edges
7. `Ansible Role` - 5 edges
8. `context7` - 4 edges
9. `litellm` - 4 edges
10. `plugin` - 4 edges

## Surprising Connections (you probably didn't know these)
- `Package Selector TUI Tool` --semantically_similar_to--> `Tools Role Main Tasks`  [INFERRED] [semantically similar]
  package-selector/README.md → ansible/roles/tools/tasks/main.yml
- `caveman-commit SKILL (Conventional Commits Generator)` --semantically_similar_to--> `OpenCode Commit Command`  [INFERRED] [semantically similar]
  skills/.agents/skills/caveman-commit/SKILL.md → opencode/.config/opencode/command/commit.md
- `Lazygit Configuration` --references--> `Lazygit (Terminal Git UI)`  [INFERRED]
  lazygit/.config/lazygit/config.yml → ansible/roles/tools/tasks/main.yml
- `Graphify Project Instructions` --conceptually_related_to--> `Dotfiles Project Overview`  [INFERRED]
  AGENTS.md → README.md
- `Ansible Deployment Documentation` --references--> `GitHub Auth One-Time Code Screenshot`  [EXTRACTED]
  ansible/README.md → ansible/assets/gh_auth_login_use_web_browser_one-time-code.png

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Ansible Role Installation Pipeline** — ansible_setup, ansible_roles_shell_tasks_main, ansible_roles_tools_tasks_main, ansible_roles_github_tasks_main, ansible_role_base [EXTRACTED 0.95]
- **Molecule Test Lifecycle** — ansible_molecule_default_prepare, ansible_molecule_default_converge, ansible_molecule_default_verify [EXTRACTED 0.95]
- **OS Family Task Dispatch Pattern** — ansible_roles_base_tasks_main, ansible_roles_base_tasks_debian, ansible_roles_base_tasks_redhat, ansible_roles_base_tasks_archlinux [EXTRACTED 0.95]
- **Ponytail Skill Family** — skills__agents_skills_ponytail_skill_ponytail, skills__agents_skills_ponytail_review_skill_ponytail_review, skills__agents_skills_ponytail_audit_skill_ponytail_audit, skills__agents_skills_ponytail_debt_skill_ponytail_debt, skills__agents_skills_ponytail_gain_skill_ponytail_gain, skills__agents_skills_ponytail_help_skill_ponytail_help [EXTRACTED 0.95]
- **Commit Message Generation Tools** — skills_agents_skills_caveman_commit_skill, opencode_config_opencode_command_commit, conventional_commits_format [INFERRED 0.75]
- **Ansible Role Template Structure** — ansible_roles__template_tasks_main, ansible_roles__template_defaults_main, ansible_roles__template_handlers_main, ansible_roles__template_meta_main [INFERRED 0.85]
- **GitHub CLI OS-Specific Installation** — ansible_roles_github_tasks_debian, ansible_roles_github_tasks_redhat, ansible_roles_github_tasks_archlinux [INFERRED 0.85]
- **OS-Specific Package Installation Pattern** — ansible_roles_docker_tasks_debian, ansible_roles_docker_tasks_redhat, ansible_roles_docker_tasks_archlinux [INFERRED 0.85]

## Communities (73 total, 46 thin omitted)

### Community 0 - "Package Selector UI"
Cohesion: 0.10
Nodes (18): App, ComposeResult, PackageSelector, Convert linear index to (row, col) grid position., Convert (row, col) grid position to linear index., Initialize app when mounted., Update display of all package items., Move cursor up in grid. (+10 more)

### Community 1 - "OpenCode Agent Config"
Cohesion: 0.10
Nodes (19): agent, code-reviewer, autoupdate, description, model, prompt, tools, enabled (+11 more)

### Community 2 - "Ansible Role Orchestration"
Cohesion: 0.12
Nodes (17): Ansible Role: base, GitHub CLI Install Task, Shell Role Metadata, Shell Role (Zsh + Oh-My-Zsh), Shell Role Tasks (Oh-My-Zsh, Plugins, Default Shell), Tools Role Defaults (lazygit, nvm, sops versions), Tools Role Metadata, Tools Role (Dev Tools) (+9 more)

### Community 3 - "Ansible Base Role (Cross-Distro)"
Cohesion: 0.13
Nodes (16): Base Role - System Dependencies, Base Role - Arch Linux Package Tasks, Base Role - Debian Package Tasks, Base Role - Main Tasks (rustup, uv, fzf), Base Role - RedHat Package Tasks, Cargo Role - Rust CLI Tools, Cargo Role - Debian Package List, Cargo Role - Main Tasks (+8 more)

### Community 4 - "Project Documentation & Assets"
Cohesion: 0.13
Nodes (15): Graphify Project Instructions, GitHub Auth One-Time Code Screenshot, GitHub Auth Validation Screenshot, PowerShell Badge Icon, Ubuntu Badge Icon, Windows Badge Icon, Bootstrap Playbook, Molecule Converge Playbook (+7 more)

### Community 5 - "Caveman & Ponytail Skills"
Cohesion: 0.17
Nodes (15): caveman-review Skill, Auto-Clarity Rule, caveman-review Skill Definition, Terse Code Review Format, ponytail-audit Skill, ponytail: Comment Marker Convention, ponytail-debt Skill, Ponytail Benchmark Scoreboard (+7 more)

### Community 6 - "OpenCode LLM Provider Config"
Cohesion: 0.18
Nodes (11): options, name, npm, options, apiKey, baseURL, profile, region (+3 more)

### Community 7 - "Git & GitHub Ansible Roles"
Cohesion: 0.22
Nodes (10): Git Role, Git Configuration Tasks, SSH Key Configuration Tasks, Git Tasks Entry Point, GitHub CLI Role, GitHub CLI Archlinux Installation Tasks, GitHub CLI Debian Installation Tasks, GitHub CLI RedHat Installation Tasks (+2 more)

### Community 8 - "Ansible Role Template"
Cohesion: 0.33
Nodes (6): Role Template Defaults, Role Template Handlers, Role Template Metadata, Ansible Role Template README, Role Template Tasks, Ansible Role

### Community 9 - "Docker Ansible Role"
Cohesion: 0.47
Nodes (6): Docker/Podman Role, Docker Archlinux Installation Tasks, Docker Debian Installation Tasks, Docker Tasks Entry Point, Docker RedHat/Podman Installation Tasks, Container Runtime (Docker/Podman)

### Community 10 - "Commit Message Tools"
Cohesion: 0.40
Nodes (6): Conventional Commits Format, OpenCode Commit Command, caveman-commit Skill README, caveman-commit SKILL (Conventional Commits Generator), caveman-help Skill README, caveman-help SKILL (Quick Reference Card)

### Community 11 - "Dotfiles Role (GNU Stow)"
Cohesion: 0.50
Nodes (4): Dotfiles Role Metadata, Dotfiles Role, Dotfiles Stow Tasks, GNU Stow Symlink Manager

## Knowledge Gaps
- **119 isolated node(s):** `$schema`, `autoupdate`, `description`, `model`, `prompt` (+114 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **46 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `provider` connect `OpenCode LLM Provider Config` to `OpenCode Agent Config`?**
  _High betweenness centrality (0.007) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `Tools Role Main Tasks` (e.g. with `Tools Role (Dev Tools)` and `Package Selector TUI Tool`) actually correct?**
  _`Tools Role Main Tasks` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 3 inferred relationships involving `Base Role - Main Tasks (rustup, uv, fzf)` (e.g. with `Discover Role - Main Tasks` and `OS Family Task Dispatch Pattern`) actually correct?**
  _`Base Role - Main Tasks (rustup, uv, fzf)` has 3 INFERRED edges - model-reasoned connections that need verification._
- **What connects `$schema`, `autoupdate`, `description` to the rest of the system?**
  _119 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Package Selector UI` be split into smaller, more focused modules?**
  _Cohesion score 0.10227272727272728 - nodes in this community are weakly interconnected._
- **Should `OpenCode Agent Config` be split into smaller, more focused modules?**
  _Cohesion score 0.1 - nodes in this community are weakly interconnected._
- **Should `Ansible Role Orchestration` be split into smaller, more focused modules?**
  _Cohesion score 0.11764705882352941 - nodes in this community are weakly interconnected._