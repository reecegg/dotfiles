-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
-- https://gist.github.com/VonHeikemen/8fc2aa6da030757a5612393d0ae060bd

return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- If already at definition when jumping to definition, "jump back" (open references)
    function Jump_to_definition()
      local current_line = vim.api.nvim_win_get_cursor(0)[1]
      nlog.log('current_line: ' .. current_line)
      vim.api.nvim_command('normal! gd')
      if current_line == vim.api.nvim_win_get_cursor(0)[1] then
        vim.api.nvim_command('normal! gr')
      end
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          local opts = { buffer = true }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Format the current buffer
        vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
          { noremap = true, silent = true })

        -- Displays hover information about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- Jump to the definition
        -- bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua Jump_to_definition()<CR>', { noremap = true, silent = true })

        -- Jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- Lists all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jumps to the definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- Lists all the references
        -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gr', '<cmd>Telescope lsp_references<cr>')

        -- Displays a function's signature information
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- Renames all references to the symbol under the cursor
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- Selects a code action available at the current cursor position
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

        -- Show diagnostics in a floating window
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

        -- Move to the previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

        -- Move to the next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
      end
    })

    -- Customize hover window appearance
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      max_width = 80,
      max_height = 30,
    })

    -- Default capabilities for all LSP servers
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    -- Custom config for lua_ls
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          format = {
            enable = true,
          },
        },
      },
    })

    -- Setup Mason LSP configuration with automatic_enable
    require('mason-lspconfig').setup({
      automatic_enable = true,
    })
  end,
}
