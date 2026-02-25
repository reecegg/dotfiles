-- :checkhealth telescope
-- :help telescope.setup()
-- :help telescope.builtin()

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    -- Setup Telescope
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {},
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      }
    }

    -- Load the extensions
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")

    -- Add Keymaps
    local builtin = require("telescope.builtin")

    -- interop:
    -- interop: vscode
    -- interop: vscode: ctrl-p to open the 'command palette' for finding files
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find Files" })
    -- interop: vscode: ctrl-P to open the 'command palette' for finding commands
    vim.keymap.set('n', '<C-P>', builtin.commands, { desc = "Commands" })

    -- core
    vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>f<leader>', builtin.resume, { desc = "Resume Finder" })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>fp', builtin.pickers, { desc = "Find Pickers" })
    vim.keymap.set('n', '<leader>fg', function()
      builtin.grep_string({ search = '', only_sort_text = true })
    end, { desc = "Fuzzy Grep" })
    vim.keymap.set('n', '<leader>fG', builtin.live_grep, { desc = "Live Grep (exact)" })
    vim.keymap.set('n', '<leader>ft', builtin.git_files, { desc = "Git Files" })

    -- project
    vim.keymap.set('n', '<leader>fs', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end, { desc = "Grep String" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })

    -- LSP
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
  end,
}
