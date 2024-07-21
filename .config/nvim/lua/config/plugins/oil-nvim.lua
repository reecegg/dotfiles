return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('oil').setup()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        -- oil keybind to open the root of the project
        vim.keymap.set("n", "<leader>-", "<CMD>Oil .<CR>", { desc = "Open project root" })
    end,
}
