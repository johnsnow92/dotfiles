# PowerShell Profile - Power User Edition
# Features: Oh-My-Posh, eza, zoxide, fzf, Terminal-Icons, posh-git, and more

# ===== Path additions (must be first!) =====
$scoopPath = "$env:USERPROFILE\scoop\shims"
if ($env:PATH -notlike "*$scoopPath*") {
    $env:PATH = "$scoopPath;$env:PATH"
}

# ===== Terminal-Icons (file/folder icons) =====
if (Get-Module -ListAvailable -Name Terminal-Icons) {
    Import-Module Terminal-Icons
}

# ===== posh-git (git integration) =====
if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
}

# ===== Oh-My-Posh (Powerlevel10k equivalent) =====
$themePath = "$env:USERPROFILE\.config\oh-my-posh\themes\powerlevel10k_rainbow.omp.json"
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config $themePath | Invoke-Expression
}

# ===== PSReadLine Configuration =====
if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine

    # History configuration
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineOption -MaximumHistoryCount 10000

    # Better history navigation with arrow keys
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    # Tab completion style
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

    # Prediction features (PowerShell 7+ only)
    $psrlVersion = (Get-Module PSReadLine).Version
    if ($psrlVersion -ge [version]"2.2.0" -and $PSVersionTable.PSVersion.Major -ge 7) {
        Set-PSReadLineOption -PredictionSource History
        Set-PSReadLineOption -PredictionViewStyle ListView
        Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGray' }
    }

    # Syntax highlighting colors
    Set-PSReadLineOption -Colors @{
        Command   = 'Green'
        Parameter = 'Gray'
        Operator  = 'Magenta'
        Variable  = 'Cyan'
        String    = 'Yellow'
        Number    = 'Yellow'
        Comment   = 'DarkGray'
    }
}

# ===== PSFzf (fuzzy finder integration) =====
if (Get-Module -ListAvailable -Name PSFzf) {
    Import-Module PSFzf

    # Ctrl+R: Fuzzy search command history
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

    # Alt+C: Fuzzy cd into subdirectory
    Set-PsFzfOption -EnableAliasFuzzySetLocation

    # Use fd for faster file finding
    $env:FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
    $env:FZF_CTRL_T_COMMAND = $env:FZF_DEFAULT_COMMAND
    $env:FZF_ALT_C_COMMAND = 'fd --type d --hidden --follow --exclude .git'
}

# ===== Eza (better ls) =====
if (Get-Command eza -ErrorAction SilentlyContinue) {
    function ls { eza --icons=always @args }
    function ll { eza -la --icons=always --git @args }
    function la { eza -a --icons=always @args }
    function lt { eza --tree --icons=always --level=2 @args }
    function llt { eza -la --tree --icons=always --level=2 --git @args }
}

# ===== Zoxide (better cd) =====
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& zoxide init powershell | Out-String)
    Set-Alias -Name cd -Value z -Option AllScope -Scope Global -Force
}

# ===== Bat (better cat) =====
if (Get-Command bat -ErrorAction SilentlyContinue) {
    function cat { bat --style=auto @args }
    function catp { bat --style=plain @args }  # Plain output
    $env:BAT_THEME = "TwoDark"
}

# ===== Ripgrep (better grep) =====
if (Get-Command rg -ErrorAction SilentlyContinue) {
    Set-Alias -Name grep -Value rg
}

# ===== Fd (better find) =====
if (Get-Command fd -ErrorAction SilentlyContinue) {
    Set-Alias -Name find -Value fd
}

# ===== Git Aliases =====
function g { git @args }
function gs { git status }
function ga { git add @args }
function gaa { git add --all }
function gc { git commit -m @args }
function gp { git push }
function gpl { git pull }
function gco { git checkout @args }
function gb { git branch @args }
function gd { git diff @args }
function gl { git log --oneline --graph --decorate -20 }
function gla { git log --oneline --graph --decorate --all }
function lg { lazygit }

# ===== Useful Aliases =====
Set-Alias -Name vim -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name top -Value btop -ErrorAction SilentlyContinue
Set-Alias -Name du -Value dust -ErrorAction SilentlyContinue
Set-Alias -Name df -Value duf -ErrorAction SilentlyContinue

# ===== Helpful Functions =====
function which { Get-Command $args[0] -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path }
function touch { param($file) if (!(Test-Path $file)) { New-Item $file -ItemType File } else { (Get-Item $file).LastWriteTime = Get-Date } }
function mkcd { param($dir) New-Item -ItemType Directory -Path $dir -Force; Set-Location $dir }

# Preview file/directory with fzf
function fzp { fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' }

# Quick directory navigation
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

# Open current directory in explorer
function open { explorer.exe . }

# Get weather
function weather { curl "wttr.in?format=3" }

# System info
function sysinfo { neofetch }

# ===== Environment Variables =====
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"

# Clear startup message
Clear-Host
