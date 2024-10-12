return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()

        -- bind toggle git blame to <leader>tgb
        local gitsigns = require('gitsigns')
        -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        vim.api.nvim_set_keymap('n', '<leader>tgb', '',
            { callback = function() gitsigns.toggle_current_line_blame() end, noremap = true, silent = true }
        )
    end
}
