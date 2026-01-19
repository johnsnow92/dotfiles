# Neovim LazyVim Cheatsheet

> Leader key: `Space`

---

## General

| Key | Action |
|-----|--------|
| `Space` | Show which-key menu (wait for popup) |
| `Space Space` | Find files (root dir) |
| `Ctrl+h/j/k/l` | Navigate windows |
| `Ctrl+Up/Down` | Resize window vertically |
| `Ctrl+Left/Right` | Resize window horizontally |
| `H` / `L` | Previous/next buffer |
| `[b` / `]b` | Previous/next buffer |

## File Navigation

| Key | Action |
|-----|--------|
| `Space f f` | Find files |
| `Space f r` | Recent files |
| `Space f g` | Live grep (search in files) |
| `Space f b` | Buffers |
| `Space f n` | New file |
| `Space e` | Explorer (neo-tree) |
| `Space E` | Explorer (cwd) |

## Buffers

| Key | Action |
|-----|--------|
| `Space b b` | Switch buffer |
| `Space b d` | Delete buffer |
| `Space b D` | Delete buffer + window |
| `Space b o` | Delete other buffers |
| `Space b p` | Toggle pin buffer |
| `Space b P` | Delete non-pinned buffers |
| `Space ,` | Switch buffer (with preview) |

## Windows

| Key | Action |
|-----|--------|
| `Space w w` | Other window |
| `Space w d` | Delete window |
| `Space w -` | Split below |
| `Space w \|` | Split right |
| `Space -` | Split below |
| `Space \|` | Split right |
| `Ctrl+h/j/k/l` | Navigate windows |

## Tabs

| Key | Action |
|-----|--------|
| `Space <tab> <tab>` | New tab |
| `Space <tab> d` | Close tab |
| `Space <tab> f` | First tab |
| `Space <tab> l` | Last tab |
| `Space <tab> [` | Previous tab |
| `Space <tab> ]` | Next tab |

## Search

| Key | Action |
|-----|--------|
| `Space /` | Grep (root dir) |
| `Space s g` | Grep (root dir) |
| `Space s G` | Grep (cwd) |
| `Space s w` | Search word under cursor |
| `Space s W` | Search word (cwd) |
| `Space s b` | Search buffer |
| `Space s s` | Goto symbol |
| `Space s S` | Goto symbol (workspace) |
| `Space s r` | Resume last search |
| `Space s h` | Help pages |
| `Space s k` | Keymaps |
| `Space s m` | Marks |
| `Space s M` | Man pages |

## Code / LSP

| Key | Action |
|-----|--------|
| `g d` | Goto definition |
| `g D` | Goto declaration |
| `g r` | References |
| `g I` | Goto implementation |
| `g y` | Goto type definition |
| `K` | Hover documentation |
| `g K` | Signature help |
| `Space c a` | Code action |
| `Space c r` | Rename |
| `Space c f` | Format |
| `Space c d` | Line diagnostics |
| `Space c l` | Lsp info |
| `Space c R` | Rename file |
| `] d` | Next diagnostic |
| `[ d` | Previous diagnostic |
| `] e` | Next error |
| `[ e` | Previous error |
| `] w` | Next warning |
| `[ w` | Previous warning |

## Git

| Key | Action |
|-----|--------|
| `Space g g` | Lazygit |
| `Space g G` | Lazygit (cwd) |
| `Space g b` | Blame line |
| `Space g B` | Browse (open in browser) |
| `Space g f` | Git files |
| `Space g c` | Git commits |
| `Space g s` | Git status |
| `Space g h` | Git hunk actions |
| `] h` | Next hunk |
| `[ h` | Previous hunk |

## Diagnostics / Trouble

| Key | Action |
|-----|--------|
| `Space x x` | Diagnostics (Trouble) |
| `Space x X` | Buffer diagnostics |
| `Space x L` | Location list |
| `Space x Q` | Quickfix list |
| `Space x t` | Todo list |
| `Space x T` | Todo/Fix/Fixme |

## Terminal

| Key | Action |
|-----|--------|
| `Space f t` | Terminal (root dir) |
| `Space f T` | Terminal (cwd) |
| `Ctrl+/` | Toggle terminal |
| `Ctrl+_` | Toggle terminal |
| `Esc Esc` | Enter normal mode (in terminal) |

## UI Toggles

| Key | Action |
|-----|--------|
| `Space u f` | Toggle format on save |
| `Space u s` | Toggle spelling |
| `Space u w` | Toggle word wrap |
| `Space u L` | Toggle relative line numbers |
| `Space u l` | Toggle line numbers |
| `Space u d` | Toggle diagnostics |
| `Space u c` | Toggle conceal |
| `Space u T` | Toggle Treesitter highlight |
| `Space u b` | Toggle background |
| `Space u h` | Toggle inlay hints |
| `Space u I` | Inspect (Treesitter) |

## Notifications

| Key | Action |
|-----|--------|
| `Space s n` | Notifications |
| `Space u n` | Dismiss notifications |

## Session

| Key | Action |
|-----|--------|
| `Space q q` | Quit all |
| `Space q s` | Restore session |
| `Space q l` | Restore last session |
| `Space q d` | Don't save session |

## Lazy Plugin Manager

| Key | Action |
|-----|--------|
| `Space l` | Lazy (plugin manager) |

---

## Text Objects

| Object | Description |
|--------|-------------|
| `a f` | Around function |
| `i f` | Inside function |
| `a c` | Around class |
| `i c` | Inside class |
| `a a` | Around argument |
| `i a` | Inside argument |

**Usage:** `d i f` (delete inside function), `v a c` (select around class)

---

## Motions & Jumps

| Key | Action |
|-----|--------|
| `s` | Flash (jump anywhere) |
| `S` | Flash Treesitter |
| `] ]` | Next reference |
| `[ [` | Previous reference |
| `] f` | Next function start |
| `[ f` | Previous function start |
| `] c` | Next class start |
| `[ c` | Previous class start |
| `%` | Matching bracket |
| `*` / `#` | Search word forward/backward |
| `n` / `N` | Next/previous search match |

---

## Editing

| Key | Action |
|-----|--------|
| `g c c` | Comment line |
| `g c` | Comment (with motion) |
| `g c` (visual) | Comment selection |
| `J` | Join lines |
| `<` / `>` (visual) | Indent left/right |
| `=` | Auto-indent |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last action |

---

## Surround (mini.surround)

| Key | Action |
|-----|--------|
| `g s a` | Add surrounding |
| `g s d` | Delete surrounding |
| `g s r` | Replace surrounding |

**Examples:**
- `g s a i w "` - Surround word with quotes
- `g s d "` - Delete surrounding quotes
- `g s r " '` - Replace `"` with `'`

---

## Neo-tree (File Explorer)

*Press `Space e` to open*

| Key | Action |
|-----|--------|
| `Enter` | Open file |
| `o` | Open file |
| `s` | Open in split |
| `S` | Open in vsplit |
| `t` | Open in new tab |
| `a` | Add file/directory |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `m` | Move |
| `y` | Copy name |
| `Y` | Copy path |
| `p` | Paste |
| `R` | Refresh |
| `H` | Toggle hidden |
| `?` | Show help |
| `q` | Close |

---

## Telescope (Fuzzy Finder)

*In Telescope popup:*

| Key | Action |
|-----|--------|
| `Ctrl+n` / `Ctrl+p` | Next/previous item |
| `j` / `k` | Next/previous (normal mode) |
| `Enter` | Confirm selection |
| `Ctrl+x` | Open in split |
| `Ctrl+v` | Open in vsplit |
| `Ctrl+t` | Open in tab |
| `Ctrl+u` / `Ctrl+d` | Scroll preview |
| `Esc` / `Ctrl+c` | Close |

---

## Mason (LSP/Tool Installer)

| Key | Action |
|-----|--------|
| `Space c m` | Mason |

*In Mason:*
- `i` - Install package
- `u` - Update package
- `X` - Uninstall package

---

## Recommended First Steps

1. **Run `:checkhealth`** - Verify setup
2. **Install language servers:** `Space c m` (Mason)
3. **Explore keymaps:** `Space s k`
4. **Check plugins:** `Space l` (Lazy)

---

## Config Locations

| Location | Purpose |
|----------|---------|
| `~/.local/share/nvim/` | Plugin data (Windows: `%LOCALAPPDATA%\nvim-data`) |
| `~/.config/nvim/` | Config (Windows: `%LOCALAPPDATA%\nvim`) |
| `lua/config/options.lua` | Vim options |
| `lua/config/keymaps.lua` | Custom keymaps |
| `lua/config/autocmds.lua` | Autocommands |
| `lua/plugins/` | Custom plugins |

---

## Adding Custom Plugins

Create a file in `lua/plugins/` (e.g., `lua/plugins/custom.lua`):

```lua
return {
  -- Add plugin
  { "username/repo" },

  -- Plugin with config
  {
    "username/repo",
    opts = {
      -- options
    },
  },

  -- Disable a LazyVim plugin
  { "plugin/name", enabled = false },
}
```

---

**LazyVim Docs:** https://www.lazyvim.org/
