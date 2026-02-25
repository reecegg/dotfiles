return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            hijack_directories = { enable = false },
            hijack_netrw = false,
        });
        vim.api.nvim_set_keymap("n", "<Leader>te", ":NvimTreeToggle<CR>",
            { desc = "Toggle Explorer", noremap = true, silent = true });
    end,
}
