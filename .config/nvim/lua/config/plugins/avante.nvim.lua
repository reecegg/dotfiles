return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
    -- add any opts here
  },
  keys = {
    { "<leader>aa", function() require("avante.api").ask() end,     desc = "avante: ask",    mode = { "n", "v" } },
    { "<leader>ar", function() require("avante.api").refresh() end, desc = "avante: refresh" },
    { "<leader>ae", function() require("avante.api").edit() end,    desc = "avante: edit",   mode = "v" },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
  },
}
