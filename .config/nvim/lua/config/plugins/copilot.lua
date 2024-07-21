-- Define the configuration options
local copilot_opts = {
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      accept = "<CR>",
      jump_prev = "[[",
      jump_next = "]]",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "right", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = false,
    debounce = 75,
    keymap = {
      accept = "<Tab>",
      -- accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
      toggle_auto_trigger = "<leader>tg"
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = true,
    -- disable for .env files
    sh = function()
      if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
        return false
      end
      return true
    end,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  --
  server_opts_overrides = {
    -- trace = "verbose",
    settings = {
      advanced = {
        listCount = 5,          -- Completions for panel
        inlineSuggestCount = 3, -- Completions for getCompletions
      }
    },
  }
}

-- After setup `:Copilot Auth`
return {
  enabled = true,
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = copilot_opts,
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
