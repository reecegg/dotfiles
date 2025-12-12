local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Color Setup
config.color_scheme = 'Default Dark (base16)'
-- Override colors
config.colors = {
  -- Override the selection background to conflict less.
  selection_fg = 'none',  -- keeps original text color
  selection_bg = '#2b3a4a', -- dim blue-gray instead of bright blue
}

-- Font Setup
config.font = wezterm.font_with_fallback({ "Hack", "DejaVu Sans Mono", "JetBrains Mono" })
config.font_size = 10.0
config.window_background_opacity = 1.0

-- Tab bar Setup
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.freetype_load_target = "Normal" -- "Light" | "Normal" | "Mono"

-- Window setup
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_content_alignment = {
  horizontal = 'Center',
  vertical = 'Center',
}

-- Redefine the font size keybindings to emit the window-resized event.
-- Limitation: The font size change appears to be happening after the window-resized event is emitted.
-- Resulting in incorrect, but good enough, padding/centering.
config.keys = {
  {
    key = "+",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.IncreaseFontSize, pane)
      window:emit_event("window-resized", pane)
    end),
  },
  {
    key = "-",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.DecreaseFontSize, pane)
      window:emit_event("window-resized", pane)
    end),
  },
  {
    key = "0",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.ResetFontSize, pane)
      window:emit_event("window-resized", pane)
    end),
  },
  {
    key = "Enter",
    mods = "ALT",
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = "n",
    mods = "SUPER",
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = "Enter",
    mods = "SHIFT",
    action = wezterm.action.SendString("\n"),
  },
}

-- fix for startup isuse
config.prefer_egl = false

return config
