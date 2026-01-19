# Dotfiles Installation Script
# Run: .\install.ps1

Write-Host "Installing dotfiles..." -ForegroundColor Cyan

# Check for Scoop
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..." -ForegroundColor Yellow
    irm get.scoop.sh | iex
}

# Add buckets
Write-Host "Adding Scoop buckets..." -ForegroundColor Yellow
scoop bucket add extras 2>$null
scoop bucket add nerd-fonts 2>$null

# Install core tools
Write-Host "Installing CLI tools..." -ForegroundColor Yellow
$tools = @(
    "git",
    "eza",
    "bat",
    "ripgrep",
    "fd",
    "fzf",
    "zoxide",
    "delta",
    "btop",
    "dust",
    "duf",
    "lazygit",
    "jq",
    "tldr",
    "neofetch"
)

foreach ($tool in $tools) {
    if (!(Get-Command $tool -ErrorAction SilentlyContinue)) {
        Write-Host "  Installing $tool..." -ForegroundColor Gray
        scoop install $tool 2>$null
    } else {
        Write-Host "  $tool already installed" -ForegroundColor DarkGray
    }
}

# Install font
Write-Host "Installing Nerd Font..." -ForegroundColor Yellow
scoop install MesloLGS-NF 2>$null

# Install WezTerm
if (!(Get-Command wezterm -ErrorAction SilentlyContinue)) {
    Write-Host "Installing WezTerm..." -ForegroundColor Yellow
    scoop install wezterm
}

# Install Oh-My-Posh
if (!(Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Oh-My-Posh..." -ForegroundColor Yellow
    winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements --accept-source-agreements
}

# Install PowerShell modules
Write-Host "Installing PowerShell modules..." -ForegroundColor Yellow
$modules = @("Terminal-Icons", "posh-git", "PSFzf")

# Ensure NuGet provider
if (!(Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
}

foreach ($module in $modules) {
    if (!(Get-Module -ListAvailable -Name $module)) {
        Write-Host "  Installing $module..." -ForegroundColor Gray
        Install-Module -Name $module -Scope CurrentUser -Force -AllowClobber
    } else {
        Write-Host "  $module already installed" -ForegroundColor DarkGray
    }
}

# Copy config files
Write-Host "Copying configuration files..." -ForegroundColor Yellow

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# WezTerm
Copy-Item "$scriptDir\wezterm.lua" "$HOME\.wezterm.lua" -Force
Write-Host "  Copied wezterm.lua" -ForegroundColor Gray

# Git config
Copy-Item "$scriptDir\gitconfig" "$HOME\.gitconfig" -Force
Write-Host "  Copied gitconfig" -ForegroundColor Gray

# PowerShell profile
$profileDir = Split-Path -Parent $PROFILE
if (!(Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
Copy-Item "$scriptDir\powershell\Microsoft.PowerShell_profile.ps1" $PROFILE -Force
Write-Host "  Copied PowerShell profile" -ForegroundColor Gray

# Oh-My-Posh themes
$themesDir = "$HOME\.config\oh-my-posh\themes"
if (!(Test-Path $themesDir)) {
    New-Item -ItemType Directory -Path $themesDir -Force | Out-Null
}
Copy-Item "$scriptDir\oh-my-posh\themes\*" $themesDir -Force
Write-Host "  Copied Oh-My-Posh themes" -ForegroundColor Gray

Write-Host "`nInstallation complete!" -ForegroundColor Green
Write-Host "Please restart your terminal to apply changes." -ForegroundColor Cyan
