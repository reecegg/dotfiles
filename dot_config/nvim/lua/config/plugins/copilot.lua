-- The copilot.suggestion module exposes the following functions:
-- require("copilot.suggestion").is_visible()
-- require("copilot.suggestion").accept(modifier)
-- require("copilot.suggestion").accept_word()
-- require("copilot.suggestion").accept_line()
-- require("copilot.suggestion").next()
-- require("copilot.suggestion").prev()
-- require("copilot.suggestion").dismiss()
-- require("copilot.suggestion").toggle_auto_trigger()

--- Copilot-tab function
--- This function will check if the suggestion is visible, if it is, it will accept the suggestion.
--- Otherwise, it will do the regular tab indent.
local function copilot_tab()
  if require("copilot.suggestion").is_visible() then
    -- Accept the suggestion outside of the callback
    vim.schedule(function()
      require("copilot.suggestion").accept()
    end)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), 'n', true)
  end
end

-- Copilot configuration

-- Define the configuration options
local copilot_opts = {
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      accept = "<CR>",
      jump_prev = "k",
      jump_next = "j",
      refresh = "r",
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
      accept = "<M-l>", -- Backup of custom tab handling as well
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
      toggle_auto_trigger = "<leader>tasg",
      trigger_suggestion = "<C-Tab>",
    },
  },
  filetypes = {
    -- Explictly Enable
    yaml = true,
    markdown = true,

    -- Explictly Disable
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,

    -- Implicitly Enable
    ["."] = true,

    -- disable for .env files to protect secrets
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

    -- Keybinds
    -- Accept suggestion with Tab or indent with Tab
    vim.api.nvim_set_keymap("i", "<Tab>", '', { callback = copilot_tab, expr = true, noremap = true, silent = true })
    -- Unindent with Shift-Tab
    vim.api.nvim_set_keymap("i", "<S-Tab>", '', { callback = function() vim.api.nvim_input("<C-d>") end, expr = true, noremap = true, silent = true })
    -- Reauthenticate
    vim.api.nvim_set_keymap("n", "<leader>masa", ":Copilot auth<CR>", { noremap = true, silent = true })
  end,
}
