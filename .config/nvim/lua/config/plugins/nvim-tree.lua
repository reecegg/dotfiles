return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup();
        vim.api.nvim_set_keymap("n", "<Leader>te", ":NvimTreeToggle<CR>",
            { desc = "Toggle Explorer", noremap = true, silent = true });
    end,
}
