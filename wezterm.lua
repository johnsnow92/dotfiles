-- WezTerm Ultimate Configuration
-- Features: Multiplexer, Quick Select, Hyperlinks, Status Bar, Command Palette,
--           Launch Menu, Pane Select, Color Switcher, WSL/SSH Domains, Shell Integration
local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- ============================================================================
-- COLOR SCHEMES (for switcher)
-- ============================================================================
local scheme_names = { "Coolnight", "Catppuccin Mocha", "Tokyo Night", "Dracula" }
local current_scheme_index = 1

-- Custom Coolnight scheme
local coolnight = {
    foreground = "#CBE0F0",
    background = "#011423",
    cursor_bg = "#47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
    tab_bar = {
        background = "#011423",
        active_tab = { bg_color = "#033259", fg_color = "#CBE0F0", intensity = "Bold" },
        inactive_tab = { bg_color = "#011423", fg_color = "#6b8a9e" },
        inactive_tab_hover = { bg_color = "#022030", fg_color = "#CBE0F0" },
        new_tab = { bg_color = "#011423", fg_color = "#47FF9C" },
        new_tab_hover = { bg_color = "#033259", fg_color = "#47FF9C" },
    },
    scrollbar_thumb = "#033259",
}

-- ============================================================================
-- FONT CONFIGURATION
-- ============================================================================
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12
config.line_height = 1.1

-- Enable ligatures
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- ============================================================================
-- WINDOW & APPEARANCE
-- ============================================================================
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 1.0  -- Set to 1.0 when using background image
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }
config.initial_rows = 30
config.initial_cols = 120

-- Background image
config.window_background_image = "C:/Users/jtamm/Pictures/wallpapers/terminal-bg.jpg"
config.window_background_image_hsb = {
    brightness = 0.15,  -- Slightly dimmed for readability
    hue = 1.0,
    saturation = 0.6,   -- Moderate saturation
}

-- Inactive pane dimming (visual focus)
config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Scrollback
config.scrollback_lines = 10000
config.enable_scroll_bar = true

-- ============================================================================
-- COLORSCHEME (Coolnight default)
-- ============================================================================
config.colors = coolnight

-- ============================================================================
-- TAB BAR
-- ============================================================================
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false  -- Always show for launch menu
config.tab_max_width = 32
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = true

-- Tab title format with icons
wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
    local title = tab.active_pane.title
    if title and #title > max_width - 4 then
        title = wezterm.truncate_right(title, max_width - 4) .. "…"
    end
    local icon = ""
    if tab.active_pane.is_zoomed then
        icon = "🔍 "
    end
    -- Show domain indicator
    local domain = tab.active_pane.domain_name or ""
    if domain:find("SSH") then
        icon = "🌐 "
    elseif domain:find("WSL") then
        icon = "🐧 "
    end
    return string.format(" %s%d: %s ", icon, tab.tab_index + 1, title or "shell")
end)

-- ============================================================================
-- LAUNCH MENU (Right-click on + button)
-- ============================================================================
config.launch_menu = {
    { label = " PowerShell", args = { "powershell.exe" } },
    { label = " CMD", args = { "cmd.exe" } },
    { label = " Git Bash", args = { "C:/Program Files/Git/bin/bash.exe", "-l" } },
    { label = "🐧 WSL (Default)", args = { "wsl.exe" } },
    { label = "󰊢 htop", args = { "wsl.exe", "-e", "htop" } },
}

-- ============================================================================
-- WSL DOMAINS
-- ============================================================================
config.wsl_domains = wezterm.default_wsl_domains()

-- ============================================================================
-- SSH DOMAINS (Add your servers here)
-- ============================================================================
config.ssh_domains = {
    -- Example: Uncomment and modify for your servers
    -- {
    --     name = "server1",
    --     remote_address = "user@server1.example.com",
    --     username = "user",
    -- },
}

-- ============================================================================
-- STATUS BAR (Right side)
-- ============================================================================
config.status_update_interval = 1000

wezterm.on("update-status", function(window, pane)
    -- Get current working directory
    local cwd = pane:get_current_working_dir()
    local cwd_str = ""
    if cwd then
        cwd_str = cwd.file_path or ""
        cwd_str = cwd_str:gsub("^C:/Users/jtamm", "~")
        cwd_str = cwd_str:gsub("^/c/Users/jtamm", "~")
        if #cwd_str > 40 then
            cwd_str = "…" .. cwd_str:sub(-38)
        end
    end

    local time = wezterm.strftime("%H:%M")
    local date = wezterm.strftime("%b %d")

    -- Battery
    local battery = ""
    for _, b in ipairs(wezterm.battery_info()) do
        local icon = ""
        if b.state_of_charge >= 0.8 then icon = "󰁹"
        elseif b.state_of_charge >= 0.6 then icon = "󰂀"
        elseif b.state_of_charge >= 0.4 then icon = "󰁾"
        elseif b.state_of_charge >= 0.2 then icon = "󰁼"
        else icon = "󰁺"
        end
        battery = string.format("%s %.0f%%", icon, b.state_of_charge * 100)
        break
    end

    local workspace = window:active_workspace()
    local domain = pane:get_domain_name()

    local status = {}

    -- Domain indicator
    if domain and domain ~= "local" then
        table.insert(status, { Foreground = { Color = "#E52E2E" } })
        table.insert(status, { Text = " 󰒋 " .. domain .. " │" })
    end

    if workspace ~= "default" then
        table.insert(status, { Foreground = { Color = "#a277ff" } })
        table.insert(status, { Text = " 󰣙 " .. workspace .. " │" })
    end

    if cwd_str ~= "" then
        table.insert(status, { Foreground = { Color = "#0FC5ED" } })
        table.insert(status, { Text = "  " .. cwd_str .. " │" })
    end

    if battery ~= "" then
        table.insert(status, { Foreground = { Color = "#44FFB1" } })
        table.insert(status, { Text = " " .. battery .. " │" })
    end

    table.insert(status, { Foreground = { Color = "#FFE073" } })
    table.insert(status, { Text = "  " .. date .. " │" })
    table.insert(status, { Foreground = { Color = "#47FF9C" } })
    table.insert(status, { Text = " 󰥔 " .. time .. " " })

    window:set_right_status(wezterm.format(status))
end)

-- ============================================================================
-- HYPERLINKS
-- ============================================================================
config.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
    regex = [[[a-zA-Z]:\\[\w\\.-]+]],
    format = "file:///$0",
})
table.insert(config.hyperlink_rules, {
    regex = [[~/[\w/.-]+]],
    format = "file:///C:/Users/jtamm/$0",
})
table.insert(config.hyperlink_rules, {
    regex = [[([\w./\\-]+):(\d+)(?::(\d+))?]],
    format = "file:///$1#$2",
})

-- ============================================================================
-- QUICK SELECT PATTERNS
-- ============================================================================
config.quick_select_patterns = {
    "[0-9a-f]{7,40}",  -- Git hashes
    "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}",  -- UUIDs
    "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}",  -- IP addresses
    "(?:/[\\w.-]+)+",  -- Unix paths
    "[A-Z]:\\\\[\\w\\\\.-]+",  -- Windows paths
    "[\\w.-]+\\.[a-z]{2,}(?:/[\\w.-]*)*",  -- URLs without protocol
}

-- ============================================================================
-- KEYBINDINGS
-- ============================================================================
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }

config.keys = {
    -- ========== COPY/PASTE ==========
    {
        key = "c",
        mods = "CTRL",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
            else
                window:perform_action(act.SendKey({ key = "c", mods = "CTRL" }), pane)
            end
        end),
    },
    { key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

    -- ========== COMMAND PALETTE & LAUNCHERS ==========
    { key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
    { key = "l", mods = "ALT", action = act.ShowLauncher },
    { key = "Enter", mods = "ALT", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS|WORKSPACES|DOMAINS|LAUNCH_MENU_ITEMS" }) },

    -- ========== TABS ==========
    { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
    { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
    { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
    { key = "1", mods = "ALT", action = act.ActivateTab(0) },
    { key = "2", mods = "ALT", action = act.ActivateTab(1) },
    { key = "3", mods = "ALT", action = act.ActivateTab(2) },
    { key = "4", mods = "ALT", action = act.ActivateTab(3) },
    { key = "5", mods = "ALT", action = act.ActivateTab(4) },
    { key = "6", mods = "ALT", action = act.ActivateTab(5) },
    { key = "7", mods = "ALT", action = act.ActivateTab(6) },
    { key = "8", mods = "ALT", action = act.ActivateTab(7) },
    { key = "9", mods = "ALT", action = act.ActivateTab(-1) },

    -- ========== TAB NAVIGATOR (Fuzzy search) ==========
    { key = "o", mods = "CTRL|SHIFT", action = act.ShowTabNavigator },

    -- ========== MOVE TABS ==========
    { key = "{", mods = "ALT|SHIFT", action = act.MoveTabRelative(-1) },
    { key = "}", mods = "ALT|SHIFT", action = act.MoveTabRelative(1) },

    -- ========== PANE SPLITTING ==========
    { key = "\\", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "x", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },

    -- ========== PANE SELECT MODE (Visual) ==========
    { key = "e", mods = "CTRL|SHIFT", action = act.PaneSelect },
    { key = "e", mods = "CTRL|SHIFT|ALT", action = act.PaneSelect({ mode = "SwapWithActive" }) },

    -- ========== PANE NAVIGATION ==========
    { key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
    { key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },

    -- ========== PANE RESIZING ==========
    { key = "LeftArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 3 }) },
    { key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = "UpArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "DownArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 3 }) },
    { key = "H", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 3 }) },
    { key = "L", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = "K", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "J", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 3 }) },

    -- ========== ROTATE PANES ==========
    { key = "r", mods = "ALT", action = act.RotatePanes("Clockwise") },
    { key = "R", mods = "ALT|SHIFT", action = act.RotatePanes("CounterClockwise") },

    -- ========== PANE ZOOM ==========
    { key = "z", mods = "ALT", action = act.TogglePaneZoomState },

    -- ========== QUICK SELECT & COPY MODE ==========
    { key = "Space", mods = "CTRL|SHIFT", action = act.QuickSelect },
    { key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },

    -- ========== CHARSELECT (Unicode picker) ==========
    { key = "u", mods = "CTRL|SHIFT", action = act.CharSelect },

    -- ========== SEARCH ==========
    { key = "f", mods = "CTRL|SHIFT", action = act.Search({ CaseInSensitiveString = "" }) },

    -- ========== COLOR SCHEME SWITCHER ==========
    {
        key = "b",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local overrides = window:get_config_overrides() or {}
            local schemes = wezterm.get_builtin_color_schemes()
            local scheme_list = { "Coolnight", "Catppuccin Mocha", "Tokyo Night", "Dracula", "Gruvbox Dark (Gogh)", "Nord" }

            -- Get current index
            local current = overrides.color_scheme or "Coolnight"
            local idx = 1
            for i, name in ipairs(scheme_list) do
                if name == current then
                    idx = i
                    break
                end
            end

            -- Cycle to next
            idx = (idx % #scheme_list) + 1
            local next_scheme = scheme_list[idx]

            if next_scheme == "Coolnight" then
                overrides.color_scheme = nil
                overrides.colors = coolnight
            else
                overrides.colors = nil
                overrides.color_scheme = next_scheme
            end

            window:set_config_overrides(overrides)
            wezterm.log_info("Switched to: " .. next_scheme)
        end),
    },

    -- ========== FONT SIZE ==========
    { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = act.ResetFontSize },

    -- ========== SCROLL ==========
    { key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-0.5) },
    { key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(0.5) },

    -- ========== WORKSPACES ==========
    { key = "n", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
    { key = "w", mods = "ALT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
    {
        key = "N",
        mods = "CTRL|SHIFT",
        action = act.PromptInputLine({
            description = wezterm.format({
                { Foreground = { Color = "#47FF9C" } },
                { Text = "Enter name for new workspace:" },
            }),
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
                end
            end),
        }),
    },

    -- ========== MISC ==========
    { key = "l", mods = "CTRL|SHIFT", action = act.ClearScrollback("ScrollbackAndViewport") },
    { key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
    { key = "d", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },

    -- ========== DOMAIN SWITCHER ==========
    {
        key = "s",
        mods = "CTRL|SHIFT",
        action = act.ShowLauncherArgs({ flags = "FUZZY|DOMAINS" }),
    },
}

-- ============================================================================
-- COPY MODE (Vim-like)
-- ============================================================================
config.key_tables = {
    copy_mode = {
        { key = "Escape", action = act.CopyMode("Close") },
        { key = "q", action = act.CopyMode("Close") },
        { key = "h", action = act.CopyMode("MoveLeft") },
        { key = "j", action = act.CopyMode("MoveDown") },
        { key = "k", action = act.CopyMode("MoveUp") },
        { key = "l", action = act.CopyMode("MoveRight") },
        { key = "w", action = act.CopyMode("MoveForwardWord") },
        { key = "b", action = act.CopyMode("MoveBackwardWord") },
        { key = "e", action = act.CopyMode("MoveForwardWordEnd") },
        { key = "0", action = act.CopyMode("MoveToStartOfLine") },
        { key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
        { key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
        { key = "g", action = act.CopyMode("MoveToScrollbackTop") },
        { key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
        { key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
        { key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
        { key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
        { key = "v", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
        { key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
        { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
        { key = "y", action = act.Multiple({
            act.CopyTo("ClipboardAndPrimarySelection"),
            act.CopyMode("Close"),
        })},
        { key = "/", action = act.Search({ CaseInSensitiveString = "" }) },
        { key = "n", action = act.CopyMode("NextMatch") },
        { key = "N", mods = "SHIFT", action = act.CopyMode("PriorMatch") },
    },
    search_mode = {
        { key = "Escape", action = act.CopyMode("Close") },
        { key = "Enter", action = act.CopyMode("AcceptPattern") },
        { key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
        { key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
    },
}

-- ============================================================================
-- MOUSE BINDINGS
-- ============================================================================
config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = act.PasteFrom("Clipboard"),
    },
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = act.OpenLinkAtMouseCursor,
    },
}

-- ============================================================================
-- SHELL INTEGRATION
-- ============================================================================
config.default_prog = { "powershell.exe" }
config.set_environment_variables = {
    TERM = "xterm-256color",
}

-- Enable shell integration features
config.term = "wezterm"

-- ============================================================================
-- NOTIFICATIONS (on bell)
-- ============================================================================
wezterm.on("bell", function(window, pane)
    -- Show visual notification
    window:toast_notification("WezTerm", "Bell in: " .. pane:get_title(), nil, 4000)
end)

-- ============================================================================
-- MISC
-- ============================================================================
config.audible_bell = "Disabled"
config.visual_bell = {
    fade_in_duration_ms = 75,
    fade_out_duration_ms = 75,
    target = "CursorColor",
}

config.window_close_confirmation = "AlwaysPrompt"
config.front_end = "OpenGL"
config.webgpu_power_preference = "HighPerformance"

-- Image protocol support (for displaying images in terminal)
config.enable_kitty_graphics = true

return config
