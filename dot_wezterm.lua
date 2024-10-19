local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Color Setup
config.color_scheme = 'Default Dark (base16)'

-- Font Setup
config.font = wezterm.font_with_fallback({ "Hack", "DejaVu Sans Mono", "JetBrains Mono" })
config.font_size = 10.0
config.window_background_opacity = 1.0

-- Tab bar Setup
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.freetype_load_target = "Normal" -- "Light" | "Normal" | "Mono"

-- Window Setup
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
} -- Set the border on the edge of the window

-- The center_content function as provided
local function center_content(window, pane)
  -- Reset padding to 0 so we can get the max content size
  local overrides = window:get_config_overrides() or {}
  local zero_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
  overrides.window_padding = zero_padding
  window:set_config_overrides(overrides)

  -- Get the dimensions of the window and the content
  local window_width_px = window:get_dimensions().pixel_width
  local window_height_px = window:get_dimensions().pixel_height
  local content_width_px = pane:get_dimensions().pixel_width
  local content_height_px = pane:get_dimensions().pixel_height

  -- Get the window vs content size difference
  local horizontal_diff = window_width_px - content_width_px
  local vertical_diff = window_height_px - content_height_px

  -- Calculate the padding
  local horizontal_padding = horizontal_diff / 2
  local vertical_padding = vertical_diff / 2

  -- Set the padding
  local recentered_padding = {
    left = horizontal_padding .. 'px',
    right = horizontal_padding .. 'px',
    top = vertical_padding .. 'px',
    bottom = vertical_padding .. 'px'
  }

  overrides.window_padding = recentered_padding
  window:set_config_overrides(overrides)
end

wezterm.on("window-resized", function(window, pane)
  center_content(window, pane)
end)

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
}

return config
