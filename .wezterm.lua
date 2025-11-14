local wezterm = require 'wezterm'
local config = {}

-- [[ Your Original Config (All Good!) ]]
config.color_scheme = 'catppuccin-mocha'
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 24

config.font = wezterm.font("Iosevka NF", {weight="Regular", stretch="Normal", style="Normal"})

-- [[ 1. New Quality-of-Life Additions ]]
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 5,
}
config.default_cwd = "CurrentPane"

-- [[ 2. Leader Key Setup (like Tmux/Vim) ]]
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- [[ 3. Main Keybindings ]]
config.keys = {
  -- Pane Navigation (Alt + h,j,k,l)
  { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },

  -- Pane Splitting (Leader + -)
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Tab Management (Leader + c, n, p, w)
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
