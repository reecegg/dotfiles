return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup as its the main color scheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- set the colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
