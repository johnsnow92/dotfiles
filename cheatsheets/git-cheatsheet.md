# Git Aliases & Commands Cheatsheet

## Git Config Aliases

*These work anywhere git is available*

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

*These work in PowerShell only*

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

### View History

```bash
gl                    # Last 20 commits (graph)
gla                   # All branches (graph)
git last              # Last commit details
gd                    # Unstaged changes
git diff --staged     # Staged changes
```

## Git with Delta (Enhanced Diffs)

Delta is configured as the default pager for better diffs:

| Feature | Description |
|---------|-------------|
| Syntax highlighting | Code is colored by language |
| Line numbers | Side-by-side line numbers |
| Word-level diffs | Highlights changed words, not just lines |
| diff3 conflicts | Shows base, ours, and theirs in conflicts |

## Lazygit Keybindings

*Press `lg` to open lazygit*

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

## Git Configuration

| Setting | Value |
|---------|-------|
| `user.name` | Jonathon Tamm |
| `user.email` | j.tamm@dynamics-group.com |
| `core.pager` | delta |
| `diff.colormoved` | default |
| `merge.conflictstyle` | diff3 |

## Useful Git Commands Reference

### Branches

```bash
git branch                    # List local branches
git branch -a                 # List all branches (including remote)
git branch -d <branch>        # Delete branch (safe)
git branch -D <branch>        # Delete branch (force)
git checkout -b <branch>      # Create and switch to branch
git merge <branch>            # Merge branch into current
git rebase <branch>           # Rebase current onto branch
```

### Remote

```bash
git remote -v                 # List remotes
git fetch                     # Fetch from remote
git pull                      # Fetch and merge
git push                      # Push to remote
git push -u origin <branch>   # Push new branch
git push --force-with-lease   # Force push (safer)
```

### Stash

```bash
git stash                     # Stash changes
git stash list                # List stashes
git stash pop                 # Apply and remove latest stash
git stash apply               # Apply but keep stash
git stash drop                # Remove latest stash
git stash clear               # Remove all stashes
```

### Tags

```bash
git tag                       # List tags
git tag v1.0.0                # Create lightweight tag
git tag -a v1.0.0 -m "msg"    # Create annotated tag
git push --tags               # Push all tags
```

### History

```bash
git log --oneline             # Compact log
git log -p                    # Log with diffs
git log --stat                # Log with file stats
git blame <file>              # Who changed each line
git show <commit>             # Show commit details
```

### Clean Up

```bash
git clean -n                  # Preview untracked file removal
git clean -fd                 # Remove untracked files/dirs
git gc                        # Garbage collect
git prune                     # Remove unreachable objects
```

---

**Git Config Location:** `~/.gitconfig`

**Edit Config:** `git config --global -e`
