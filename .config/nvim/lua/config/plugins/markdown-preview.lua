return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && npm install",
  config = function()
    vim.keymap.set("n", "<leader>tmp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview", noremap = true, silent = true })
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
