return {
   'nvim-telescope/telescope.nvim',
   tag = '0.1.8',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/which-key.nvim'
   },
   config = function()
      local builtin = require('telescope.builtin')
      -- core
      vim.keymap.set('n', '<leader>f<leader>', builtin.resume, { desc = "Resume Finder" })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fp', builtin.pickers, { desc = "Find Pickers"})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>ft', builtin.git_files, { desc = "Git Files" })

      -- project
      vim.keymap.set('n', '<leader>fs', function()
         builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end, { desc = "Grep String" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })

      -- text

      -- Ensure which-key is installed and set up
      require("which-key").setup {}

      -- Register keymaps with which-key using the new spec
      local wk = require("which-key")
      wk.add({
         { "<leader>f", group = "Finder" },
      })
   end,
}
