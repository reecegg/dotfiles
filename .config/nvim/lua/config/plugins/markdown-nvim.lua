return {
  'MeanderingProgrammer/markdown.nvim',
  -- Needed if these is another plugin named markdown.nvim
  name = 'render-markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('render-markdown').setup({})
    vim.keymap.set("n", "<leader>tmr", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle In-line render", noremap = true, silent = true })
  end,
}
