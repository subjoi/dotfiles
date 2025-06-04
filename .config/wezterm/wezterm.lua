local wezterm = require 'wezterm'
local helpers = require 'helpers'

local config = wezterm.config_builder()
local act = wezterm.action

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

config.colors = {
  tab_bar = {
    background = '#191724',

    active_tab = {
      bg_color = '#26233A',
      fg_color = '#E0DEF4',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = '#191724',
      fg_color = '#6E6A86',
    },
    inactive_tab_hover = {
      bg_color = '#191724',
      fg_color = '#E0DEF4',
    },
    new_tab = {
      bg_color = '#191724',
      fg_color = '#3E8FB0',
      intensity = 'Bold',
    },
    new_tab_hover = {
      bg_color = '#191724',
      fg_color = '#3E8FB0',
      intensity = 'Bold',
    },
  }
}

config.window_padding = {
  left   = "10px",
  right  = "10px",
  top    = "10px",
  bottom = "10px",
}
-- config.window_frame = {
--   font = wezterm.font { family = 'Inter', weight = 'Bold' },
--   font_size = 10.0,
--   active_titlebar_bg = '#191724',
--   inactive_titlebar_bg = '#191724',
-- }

config.font = wezterm.font 'MesloLGS Nerd Font'
config.font_size = 12

config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  -- Panes
  { key = 'v', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 's', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'q', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true }, },

  -- { key = '8', mods = 'CTRL', action = act.PaneSelect },
  { key = '9', mods = 'CTRL', action = act.PaneSelect { mode = 'SwapWithActiveKeepFocus' }, },
}

helpers.apply_to_config(config)
return config
