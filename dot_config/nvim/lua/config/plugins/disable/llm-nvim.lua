return {
  'llm',
  dir = '~/.config/nvim/lua/local-plugins/llm/init.lua',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('local-plugins.llm').setup({})

    local llm = require('local-plugins.llm')


    vim.keymap.set("n", "<leader>la", function() llm.create_llm_md() end, { desc = "Create llm.md" })

    -- keybinds for prompting with groq
    -- vim.keymap.set("n", "<leader>,", function() llm.prompt({ replace = false, service = "groq" }) end, { desc = "Prompt with groq" })
    -- vim.keymap.set("v", "<leader>,", function() llm.prompt({ replace = false, service = "groq" }) end, { desc = "Prompt with groq" })
    -- vim.keymap.set("v", "<leader>.", function() llm.prompt({ replace = true, service = "groq" }) end, { desc = "Prompt while replacing with groq" })

    -- keybinds for prompting with openai
    vim.keymap.set("n", "<leader>g,", function() llm.prompt({ replace = false, service = "openai" }) end, { desc = "Prompt with openai" })
    vim.keymap.set("v", "<leader>g,", function() llm.prompt({ replace = false, service = "openai" }) end, { desc = "Prompt with openai" })
    vim.keymap.set("v", "<leader>g.", function() llm.prompt({ replace = true, service = "openai" }) end, { desc = "Prompt while replacing with openai" })

    -- keybinds to support vim motions
    vim.keymap.set("n", "g,", function() llm.prompt_operatorfunc({ replace = false, service = "groq" }) end, { desc = "Prompt with groq" })
    vim.keymap.set("n", "g.", function() llm.prompt_operatorfunc({ replace = true, service = "groq" }) end, { desc = "Prompt while replacing with groq" })

    -- vim.keymap.set({ 'n', 'v' }, '<leader>k', groq_replace, { desc = 'llm groq' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>K', groq_help, { desc = 'llm groq_help' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>L', openai_help, { desc = 'llm openai_help' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>l', openai_replace, { desc = 'llm openai' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>I', anthropic_help, { desc = 'llm anthropic_help' })
    -- vim.keymap.set({ 'n', 'v' }, '<leader>i', anthropic_replace, { desc = 'llm anthropic' })
  end,
}
