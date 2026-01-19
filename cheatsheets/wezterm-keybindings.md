# WezTerm Keybindings Reference

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
| `Alt+LeftArrow` | Move to left pane |
| `Alt+RightArrow` | Move to right pane |
| `Alt+UpArrow` | Move to pane above |
| `Alt+DownArrow` | Move to pane below |
| `Alt+H` | Move to left pane (vim-style) |
| `Alt+L` | Move to right pane (vim-style) |
| `Alt+K` | Move to pane above (vim-style) |
| `Alt+J` | Move to pane below (vim-style) |

## Pane Resizing

| Shortcut | Action |
|----------|--------|
| `Alt+Shift+LeftArrow` | Resize pane left |
| `Alt+Shift+RightArrow` | Resize pane right |
| `Alt+Shift+UpArrow` | Resize pane up |
| `Alt+Shift+DownArrow` | Resize pane down |
| `Alt+Shift+H` | Resize pane left (vim-style) |
| `Alt+Shift+L` | Resize pane right (vim-style) |
| `Alt+Shift+K` | Resize pane up (vim-style) |
| `Alt+Shift+J` | Resize pane down (vim-style) |

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

## Search

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+F` | Search in scrollback |

## CharSelect (Unicode Picker)

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+U` | Open unicode character picker |

## Color Scheme

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+B` | Cycle color schemes (Coolnight → Catppuccin Mocha → Tokyo Night → Dracula → Gruvbox → Nord) |

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

## Workspaces

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+N` | Switch to workspace (existing) |
| `Ctrl+Shift+N` (uppercase) | Create new named workspace |
| `Alt+W` | Fuzzy search workspaces |

## Domain Switcher

| Shortcut | Action |
|----------|--------|
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
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Move forward word |
| `b` | Move backward word |
| `e` | Move to end of word |
| `0` | Move to start of line |
| `$` | Move to end of line content |
| `^` | Move to start of line content |
| `g` | Move to top of scrollback |
| `G` | Move to bottom of scrollback |
| `H` | Move to top of viewport |
| `M` | Move to middle of viewport |
| `L` | Move to bottom of viewport |
| `v` | Start character selection |
| `V` | Start line selection |
| `Ctrl+V` | Start block selection |
| `y` | Yank (copy) and exit |
| `/` | Search |
| `n` | Next match |
| `N` | Previous match |

## Search Mode

*Active after pressing `/` in copy mode or `Ctrl+Shift+F`*

| Key | Action |
|-----|--------|
| `Escape` | Exit search |
| `Enter` | Accept search pattern |
| `Ctrl+R` | Cycle match type (case sensitive, regex, etc.) |
| `Ctrl+U` | Clear search pattern |

## Mouse Bindings

| Action | Binding |
|--------|---------|
| Paste | Right-click |
| Open hyperlink | Ctrl+Left-click |

## Launch Menu Options

*Right-click the `+` button on tab bar*

| Option | Shell |
|--------|-------|
| PowerShell | `powershell.exe` |
| CMD | `cmd.exe` |
| Git Bash | Git Bash |
| WSL (Default) | Default WSL distro |
| htop | htop in WSL |

---

**Leader Key:** `Ctrl+A` (1.5 second timeout) — currently unused but available for custom sequences

**Config Location:** `C:\Users\jtamm\.wezterm.lua`
