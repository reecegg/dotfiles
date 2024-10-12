return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- disable table mode as its causing slow down: https://github.com/dhruvasagar/vim-table-mode/issues/227
    vim.g.table_mode_syntax = 0

    require('render-markdown').setup({
      -- simpligy code block border to align with the markdown text content
      code = {
        border = 'thick',
      },
      -- simplify table to minimize content jumping between modes
      pipe_table = {
        style = 'normal',
      }
    })
    vim.keymap.set("n", "<leader>tmr", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle In-line render", noremap = true, silent = true })
  end,
}
