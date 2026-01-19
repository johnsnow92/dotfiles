# Dotfiles

Personal terminal configuration for Windows with WezTerm, PowerShell, and Git.

## Contents

```
dotfiles/
├── wezterm.lua                    # WezTerm terminal configuration
├── gitconfig                      # Git configuration and aliases
├── powershell/
│   └── Microsoft.PowerShell_profile.ps1  # PowerShell profile
├── oh-my-posh/
│   └── themes/                    # Oh-My-Posh prompt themes
│       ├── powerlevel10k_rainbow.omp.json (active)
│       ├── catppuccin_mocha.omp.json
│       ├── tokyo.omp.json
│       ├── dracula.omp.json
│       ├── agnoster.omp.json
│       └── paradox.omp.json
└── install.ps1                    # Installation script
```

## Features

### WezTerm
- Coolnight color scheme with 5 alternatives
- Multiplexer (panes, tabs, workspaces)
- Status bar with cwd, battery, time
- Background image support
- Quick select, copy mode, hyperlinks
- WSL and SSH domain support
- Launch menu for different shells

### PowerShell
- Oh-My-Posh prompt (Powerlevel10k theme)
- PSReadLine with history search
- PSFzf for fuzzy finding (Ctrl+R, Ctrl+T)
- Modern CLI tools (eza, bat, ripgrep, fd, zoxide)
- Git shortcuts and lazygit integration

### Git
- Delta for enhanced diffs
- Useful aliases (st, co, br, lg, undo, amend)
- diff3 merge conflict style

## Installation

### Quick Install (PowerShell)

```powershell
.\install.ps1
```

### Manual Install

1. **Install dependencies (via Scoop)**
   ```powershell
   # Install Scoop
   irm get.scoop.sh | iex

   # Add buckets
   scoop bucket add extras
   scoop bucket add nerd-fonts

   # Install tools
   scoop install git wezterm MesloLGS-NF
   scoop install eza bat ripgrep fd fzf zoxide delta btop dust duf lazygit jq tldr neofetch

   # Install Oh-My-Posh
   winget install JanDeDobbeleer.OhMyPosh

   # Install PowerShell modules
   Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
   Install-Module -Name posh-git -Scope CurrentUser -Force
   Install-Module -Name PSFzf -Scope CurrentUser -Force
   ```

2. **Symlink/copy config files**
   ```powershell
   # WezTerm
   Copy-Item wezterm.lua $HOME\.wezterm.lua

   # Git
   Copy-Item gitconfig $HOME\.gitconfig

   # PowerShell profile
   Copy-Item powershell\Microsoft.PowerShell_profile.ps1 $PROFILE

   # Oh-My-Posh themes
   New-Item -ItemType Directory -Path $HOME\.config\oh-my-posh\themes -Force
   Copy-Item oh-my-posh\themes\* $HOME\.config\oh-my-posh\themes\
   ```

3. **Restart WezTerm**

## Keybindings Reference

See the cheatsheets in `~/`:
- `terminal-cheatsheet.md` - Master reference
- `wezterm-keybindings.md` - WezTerm shortcuts
- `powershell-cheatsheet.md` - Shell aliases
- `git-cheatsheet.md` - Git commands

## Updating

To update dotfiles after making changes:

```powershell
cd ~/dotfiles

# Copy updated configs
Copy-Item $HOME\.wezterm.lua wezterm.lua
Copy-Item $PROFILE powershell\Microsoft.PowerShell_profile.ps1
Copy-Item $HOME\.gitconfig gitconfig

# Commit
git add -A
git commit -m "Update configs"
git push
```
