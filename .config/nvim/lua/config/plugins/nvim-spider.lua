return {
  enabled = false,
  "chrisgrieser/nvim-spider",
  config = function()
    vim.keymap.set(
      { "n", "o", "x" },
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      { desc = "Spider-w" }
    )
    vim.keymap.set(
      { "n", "o", "x" },
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      { desc = "Spider-e" }
    )
    vim.keymap.set(
      { "n", "o", "x" },
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      { desc = "Spider-b" }
    )
    vim.keymap.set("i", "<C-f>", "<Esc>l<cmd>lua require('spider').motion('w')<CR>i")
    vim.keymap.set("i", "<C-b>", "<Esc><cmd>lua require('spider').motion('b')<CR>i")
  end,
}
