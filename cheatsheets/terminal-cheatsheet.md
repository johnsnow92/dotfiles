# Terminal Master Cheatsheet

> WezTerm + PowerShell + Git - Complete Reference

---

# WezTerm Keybindings

## Copy / Paste

| Shortcut | Action |
|----------|--------|
| `Ctrl+C` | Smart copy (copies if selection exists, otherwise sends interrupt) |
| `Ctrl+V` | Paste from clipboard |
| `Right-click` | Paste from clipboard |

## Command Palette & Launchers

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+P` | Open command palette |
| `Alt+L` | Show launcher menu |
| `Alt+Enter` | Fuzzy launcher (tabs, workspaces, domains, launch menu) |

## Tabs

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close current tab (with confirmation) |
| `Ctrl+Tab` | Next tab |
| `Ctrl+Shift+Tab` | Previous tab |
| `Alt+1` to `Alt+8` | Switch to tab 1-8 |
| `Alt+9` | Switch to last tab |
| `Ctrl+Shift+O` | Tab navigator (fuzzy search) |
| `Alt+Shift+{` | Move tab left |
| `Alt+Shift+}` | Move tab right |

## Pane Splitting

| Shortcut | Action |
|----------|--------|
| `Alt+\` | Split pane horizontally (side by side) |
| `Alt+-` | Split pane vertically (top/bottom) |
| `Alt+X` | Close current pane (with confirmation) |

## Pane Selection & Swap

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+E` | Pane select mode (visual overlay with letters) |
| `Ctrl+Shift+Alt+E` | Swap panes (select which pane to swap with) |

## Pane Navigation

| Shortcut | Action |
|----------|--------|
| `Alt+Arrow` | Move to pane in direction |
| `Alt+H/J/K/L` | Move to pane (vim-style) |

## Pane Resizing

| Shortcut | Action |
|----------|--------|
| `Alt+Shift+Arrow` | Resize pane in direction |
| `Alt+Shift+H/J/K/L` | Resize pane (vim-style) |

## Pane Layout

| Shortcut | Action |
|----------|--------|
| `Alt+R` | Rotate panes clockwise |
| `Alt+Shift+R` | Rotate panes counter-clockwise |
| `Alt+Z` | Toggle pane zoom (fullscreen current pane) |

## Quick Select & Copy Mode

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+Space` | Quick select (highlight clickable items) |
| `Ctrl+Shift+X` | Enter copy mode (vim-like selection) |

## Search & Utilities

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+F` | Search in scrollback |
| `Ctrl+Shift+U` | Unicode character picker (CharSelect) |
| `Ctrl+Shift+B` | Cycle color schemes |

## Font Size

| Shortcut | Action |
|----------|--------|
| `Ctrl+=` | Increase font size |
| `Ctrl+-` | Decrease font size |
| `Ctrl+0` | Reset font size |

## Scrolling

| Shortcut | Action |
|----------|--------|
| `Shift+PageUp` | Scroll up half page |
| `Shift+PageDown` | Scroll down half page |

## Workspaces & Domains

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+N` | Switch/create workspace |
| `Alt+W` | Fuzzy search workspaces |
| `Ctrl+Shift+S` | Switch domains (Local, WSL, SSH) |

## Miscellaneous

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+L` | Clear scrollback and viewport |
| `Ctrl+Shift+R` | Reload configuration |
| `Ctrl+Shift+D` | Show debug overlay |

## Copy Mode (Vim-like)

*Active after pressing `Ctrl+Shift+X`*

| Key | Action |
|-----|--------|
| `Escape` / `q` | Exit copy mode |
| `h/j/k/l` | Move cursor |
| `w/b/e` | Word navigation |
| `0` / `$` / `^` | Line navigation |
| `g` / `G` | Top/bottom of scrollback |
| `H/M/L` | Top/middle/bottom of viewport |
| `v` / `V` / `Ctrl+V` | Character/line/block selection |
| `y` | Yank (copy) and exit |
| `/` | Search |
| `n` / `N` | Next/previous match |

## Mouse Bindings

| Action | Binding |
|--------|---------|
| Paste | Right-click |
| Open hyperlink | Ctrl+Left-click |

## Launch Menu

*Right-click the `+` button on tab bar*

- PowerShell, CMD, Git Bash, WSL, htop

---

# PowerShell Aliases & Functions

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

## PowerShell Modules

| Module | Purpose |
|--------|---------|
| `Terminal-Icons` | File/folder icons in listings |
| `posh-git` | Git status in prompt |
| `PSReadLine` | Enhanced readline (history, completion) |
| `PSFzf` | fzf integration for PowerShell |
| `Oh-My-Posh` | Beautiful prompt themes |

---

# Git Aliases & Commands

## Git Config Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `git st` | `git status` | Show working tree status |
| `git co <branch>` | `git checkout <branch>` | Switch branches |
| `git br` | `git branch` | List branches |
| `git ci` | `git commit` | Commit changes |
| `git lg` | `git log --oneline --graph --decorate --all` | Pretty log graph |
| `git last` | `git log -1 HEAD --stat` | Show last commit with stats |
| `git unstage <file>` | `git reset HEAD -- <file>` | Unstage a file |
| `git undo` | `git reset --soft HEAD~1` | Undo last commit (keep changes) |
| `git amend` | `git commit --amend --no-edit` | Add to last commit |

## PowerShell Git Functions

| Function | Command | Description |
|----------|---------|-------------|
| `g <args>` | `git <args>` | Short git command |
| `gs` | `git status` | Show status |
| `ga <files>` | `git add <files>` | Stage files |
| `gaa` | `git add --all` | Stage all changes |
| `gc "msg"` | `git commit -m "msg"` | Commit with message |
| `gp` | `git push` | Push to remote |
| `gpl` | `git pull` | Pull from remote |
| `gco <branch>` | `git checkout <branch>` | Switch branches |
| `gb` | `git branch` | List branches |
| `gd` | `git diff` | Show unstaged changes |
| `gl` | `git log --oneline --graph --decorate -20` | Pretty log (last 20) |
| `gla` | `git log --oneline --graph --decorate --all` | Pretty log (all branches) |
| `lg` | `lazygit` | Open lazygit TUI |

## Common Git Workflows

### Daily Workflow

```bash
gs                    # Check status
ga .                  # Stage all changes
gc "feat: add feature"  # Commit
gp                    # Push
```

### Branch Workflow

```bash
gco -b feature/name   # Create and switch to new branch
# ... make changes ...
ga . && gc "message"  # Stage and commit
gp -u origin feature/name  # Push new branch
```

### Undo & Fix Mistakes

```bash
git undo              # Undo last commit (keep changes staged)
git unstage <file>    # Unstage a file
git amend             # Add changes to last commit
git checkout -- <file>  # Discard changes to file
git stash             # Temporarily save changes
git stash pop         # Restore stashed changes
```

## Lazygit Keybindings

*Press `lg` to open*

| Key | Action |
|-----|--------|
| `?` | Show all keybindings |
| `j/k` | Navigate up/down |
| `h/l` | Switch panels |
| `Space` | Stage/unstage file |
| `a` | Stage all |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `b` | Branch menu |
| `m` | Merge menu |
| `z` | Undo (reflog) |
| `q` | Quit |

## Git Commands Reference

### Branches

```bash
git branch -a                 # List all branches
git branch -d <branch>        # Delete branch (safe)
git checkout -b <branch>      # Create and switch
git merge <branch>            # Merge into current
git rebase <branch>           # Rebase onto branch
```

### Remote

```bash
git remote -v                 # List remotes
git fetch                     # Fetch from remote
git push -u origin <branch>   # Push new branch
git push --force-with-lease   # Force push (safer)
```

### Stash

```bash
git stash                     # Stash changes
git stash list                # List stashes
git stash pop                 # Apply and remove
git stash drop                # Remove latest
```

### History

```bash
git log --oneline             # Compact log
git log -p                    # Log with diffs
git blame <file>              # Who changed each line
git show <commit>             # Show commit details
```

---

# Configuration Files

| File | Purpose |
|------|---------|
| `~/.wezterm.lua` | WezTerm configuration |
| `~/OneDrive/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` | PowerShell profile |
| `~/.gitconfig` | Git configuration |
| `~/.config/oh-my-posh/themes/` | Oh-My-Posh themes |

**Reload PowerShell Profile:** `. $PROFILE`

**Reload WezTerm Config:** `Ctrl+Shift+R`

**Edit Git Config:** `git config --global -e`
