return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup as its the main color scheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("tokyonight").setup({
      plugins = { markdown = true }, -- Until this is merged and plugin updated: https://github.com/folke/tokyonight.nvim/pull/620
      -- enable the italics
      italics = {
        comments = true,
        keywords = true,
        functions = true,
        strings = false,
        variables = false,
      },
    })

    -- set the colorscheme
    vim.cmd.colorscheme("tokyonight")
  end,
}
