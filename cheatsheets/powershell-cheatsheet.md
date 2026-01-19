# PowerShell Aliases & Functions Cheatsheet

## PSReadLine Keybindings

| Shortcut | Action |
|----------|--------|
| `UpArrow` | Search history backward (matching current input) |
| `DownArrow` | Search history forward (matching current input) |
| `Tab` | Menu-style tab completion |
| `Ctrl+R` | Fuzzy search command history (fzf) |
| `Ctrl+T` | Fuzzy file finder (fzf) |

## File Listing (eza)

| Command | Description |
|---------|-------------|
| `ls` | List files with icons |
| `ll` | Long list with icons, hidden files, and git status |
| `la` | List all files (including hidden) with icons |
| `lt` | Tree view (2 levels deep) with icons |
| `llt` | Long tree view with git status |

## Directory Navigation (zoxide)

| Command | Description |
|---------|-------------|
| `cd <path>` | Smart directory jump (learns from usage) |
| `z <query>` | Jump to frequently used directory matching query |
| `zi` | Interactive directory selection |
| `..` | Go up one directory |
| `...` | Go up two directories |
| `....` | Go up three directories |

## File Operations

| Command | Description |
|---------|-------------|
| `cat <file>` | View file with syntax highlighting (bat) |
| `catp <file>` | View file plain (no line numbers/decorations) |
| `touch <file>` | Create file or update timestamp |
| `mkcd <dir>` | Create directory and cd into it |
| `open` | Open current directory in Explorer |

## Search Tools

| Command | Description |
|---------|-------------|
| `grep <pattern>` | Search file contents (ripgrep) |
| `find <pattern>` | Find files by name (fd) |
| `fzp` | Fuzzy find with bat preview |

## Git Shortcuts

| Command | Description |
|---------|-------------|
| `g` | Git (pass any git command) |
| `gs` | `git status` |
| `ga <files>` | `git add <files>` |
| `gaa` | `git add --all` |
| `gc "message"` | `git commit -m "message"` |
| `gp` | `git push` |
| `gpl` | `git pull` |
| `gco <branch>` | `git checkout <branch>` |
| `gb` | `git branch` |
| `gd` | `git diff` |
| `gl` | Git log (oneline, graph, last 20) |
| `gla` | Git log (oneline, graph, all branches) |
| `lg` | Open lazygit (TUI git client) |

## System Tools

| Command | Description |
|---------|-------------|
| `vim` | Open Neovim |
| `top` | Open btop (system monitor) |
| `du` | Disk usage analyzer (dust) |
| `df` | Disk free space (duf) |
| `which <cmd>` | Show path of command |
| `weather` | Show current weather |
| `sysinfo` | Show system info (neofetch) |

## Installed CLI Tools

| Tool | Replaces | Description |
|------|----------|-------------|
| `eza` | `ls` | Modern ls with icons and git |
| `bat` | `cat` | Cat with syntax highlighting |
| `ripgrep (rg)` | `grep` | Fast regex search |
| `fd` | `find` | Fast file finder |
| `fzf` | - | Fuzzy finder |
| `zoxide` | `cd` | Smart directory jumper |
| `delta` | - | Better git diffs |
| `btop` | `top` | System monitor |
| `dust` | `du` | Disk usage visualizer |
| `duf` | `df` | Disk free visualizer |
| `lazygit` | - | TUI git client |
| `tldr` | `man` | Simplified man pages |
| `jq` | - | JSON processor |
| `neofetch` | - | System info display |

## Environment Variables

| Variable | Value |
|----------|-------|
| `$env:EDITOR` | `nvim` |
| `$env:VISUAL` | `nvim` |
| `$env:BAT_THEME` | `TwoDark` |
| `$env:FZF_DEFAULT_COMMAND` | `fd --type f --hidden --follow --exclude .git` |

## PowerShell Modules

| Module | Purpose |
|--------|---------|
| `Terminal-Icons` | File/folder icons in listings |
| `posh-git` | Git status in prompt |
| `PSReadLine` | Enhanced readline (history, completion) |
| `PSFzf` | fzf integration for PowerShell |
| `Oh-My-Posh` | Beautiful prompt themes |

## Oh-My-Posh Theme

**Current Theme:** `powerlevel10k_rainbow`

**Theme Location:** `~/.config/oh-my-posh/themes/`

**Available Themes:**
- `powerlevel10k_rainbow.omp.json`
- `catppuccin_mocha.omp.json`
- `tokyo.omp.json`
- `dracula.omp.json`
- `agnoster.omp.json`
- `paradox.omp.json`

To change theme, edit the profile:
```powershell
notepad $PROFILE
# Change $themePath to desired theme
```

---

**Profile Location:** `C:\Users\jtamm\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

**Reload Profile:** `. $PROFILE`
