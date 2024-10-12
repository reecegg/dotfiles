return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup()

    -- Keybinds
    vim.api.nvim_set_keymap('n', '<leader>mpk', ':Mason<CR>', { noremap = true, silent = true })
  end,
}
