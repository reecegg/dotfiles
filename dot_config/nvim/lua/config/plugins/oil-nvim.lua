return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    -- oil keybind to open the root of the project
    vim.keymap.set("n", "<leader>-", "<CMD>Oil .<CR>", { desc = "Open project root" })

    -- Refresh oil buffers on focus to pick up external file changes
    vim.api.nvim_create_autocmd("FocusGained", {
      callback = function()
        local view_ok, view = pcall(require, 'oil.view')
        if view_ok and view.rerender_all_oil_buffers then
          view.rerender_all_oil_buffers({ refetch = true })
        end
      end,
    })
  end,
}
