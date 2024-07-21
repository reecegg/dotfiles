return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
        vim.keymap.nnoremap({ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>" })
    end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
}
