-- Globally load the nlog module
if _G.nlog then
    print("Warning: 'nlog' is already defined in the global scope. Overwriting it.")
end
_G.nlog = require("nlog")

-- Fundamental mapping required before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load core configuration
require("config.core")

-- Load plugins
require("config.lazy")


-- TODO: move
-- Load LSP
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings to see the available actions
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false,
  })

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
end)

-- setup the language servers
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    -- Markdown Setup

    -- Lua Setup
    'lua_ls',

    -- Rust Setup
    'rust_analyzer',
  },
})

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      format = {
        enable = true,
      },
    },
  },
}

require("lspconfig").rust_analyzer.setup {}

-- Format keybind
vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

-- Enter key to confirm completions
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})
