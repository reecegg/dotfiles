-- Fucntion to manually set indentation
local function set_indentation(indent_type, size)
    if indent_type == "space" then
        vim.bo.expandtab = true
        vim.bo.shiftwidth = size
        vim.bo.tabstop = size
    elseif indent_type == "tab" then
        vim.bo.expandtab = false
        vim.bo.shiftwidth = size
        vim.bo.tabstop = size
    end
    print("Indentation set to " .. size .. " " .. indent_type .. "(s)")
end

-- Function to toggle virtual edit
local function toggle_virtual_edit()
    if vim.o.virtualedit == "all" then
        vim.o.virtualedit = ""
        print("Virtual edit disabled")
    else
        vim.o.virtualedit = "all"
        print("Virtual edit enabled")
    end
end

-- Netrw
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)

-- Better escape with 'jk', 'jj', and 'kk'
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, desc = "Escape insert mode" })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, desc = "Escape insert mode" })
vim.api.nvim_set_keymap('i', 'kk', '<Esc>', { noremap = true, desc = "Escape insert mode" })

-- Better write/quit/exit
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, desc = "Quit" })
vim.api.nvim_set_keymap('n', '<leader>qq', ':q<CR>', { noremap = true, desc = "Quit" })
vim.api.nvim_set_keymap('n', '<leader>qa', ':qa<CR>', { noremap = true, desc = "Quit all" })
vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { noremap = true, desc = "Save and quit" })
vim.api.nvim_set_keymap('n', '<leader>ww', ':w<CR>', { noremap = true, desc = "Save" })
vim.api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { noremap = true, desc = "Save and quit" })
vim.api.nvim_set_keymap('n', '<leader>wa', ':wa<CR>', { noremap = true, desc = "Save all" })

-- Move up/down visual lines by default
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, desc = "Move down visually" })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, desc = "Move up visually" })

-- Buffers
-- vim.api.nvim_set_keymap('n', '<tab>', ':bn<CR>', { noremap = true, desc = "Next buffer" })
-- vim.api.nvim_set_keymap('n', '<s-tab>', ':bp<CR>', { noremap = true, desc = "Previous buffer" })
-- vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, desc = "Delete buffer" })

-- Move through grep results
vim.api.nvim_set_keymap('n', '<leader><right>', ':cnext<CR>', { noremap = true, desc = "Next grep result" })
vim.api.nvim_set_keymap('n', '<leader><left>', ':cprev<CR>', { noremap = true, desc = "Previous grep result" })

-- Split navigation using single key combination
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true, desc = "Move to split below" })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true, desc = "Move to split above" })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true, desc = "Move to split right" })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true, desc = "Move to split left" })

-- Toggle
-- Toggle: showing hidden characters
vim.api.nvim_set_keymap('n', '<leader>t<space>', ':set invlist<CR>', { noremap = true, desc = "Toggle list" })
-- Toggle: line numbers
vim.api.nvim_set_keymap('n', '<leader>tn', ':set invnumber<CR>', { noremap = true, desc = "Toggle number" })
-- Toggle: relative line numbers
vim.api.nvim_set_keymap('n', '<leader>tr', ':set invrelativenumber<CR>',
    { noremap = true, desc = "Toggle relative number" })
-- Toggle: line wrapping
vim.api.nvim_set_keymap('n', '<leader>tw', ':set invwrap<CR>',
    { noremap = true, silent = true, desc = "Toggle wrapping" })
-- Toggle: virtual edit
vim.api.nvim_set_keymap('n', '<leader>tv', '',
    { callback = function() toggle_virtual_edit() end, noremap = true, silent = true, desc = "Toggle virtual edit" })


-- Meta: Meta
vim.api.nvim_set_keymap('n', '<leader>mme', ':e ~/.config/nvim/init.lua<CR>', { noremap = true, desc = "Edit init.lua" })
vim.api.nvim_set_keymap('n', '<leader>mmr', ':so ~/.config/nvim/init.lua<CR>',
    { noremap = true, desc = "Source init.lua" })

-- Meta: Syntax
vim.api.nvim_set_keymap('n', '<leader>mms', ':syntax sync fromstart<CR>', { noremap = true, desc = "Resync syntax" })

-- Meta: Indentation
vim.api.nvim_set_keymap('n', '<leader>mi2', '',
    {
        callback = function() set_indentation("space", 2) end,
        noremap = true,
        silent = true,
        desc =
        "Set indentation to 2 spaces"
    })
vim.api.nvim_set_keymap('n', '<leader>mi3', '',
    {
        callback = function() set_indentation("space", 3) end,
        noremap = true,
        silent = true,
        desc =
        "Set indentation to 3 spaces"
    })
vim.api.nvim_set_keymap('n', '<leader>mi4', '',
    {
        callback = function() set_indentation("space", 4) end,
        noremap = true,
        silent = true,
        desc =
        "Set indentation to 4 spaces"
    })
vim.api.nvim_set_keymap('n', '<leader>mit', '',
    {
        callback = function() set_indentation("tab", 4) end,
        noremap = true,
        silent = true,
        desc =
        "Set indentation to tabs"
    })

-- Working Directory
vim.api.nvim_set_keymap('n', '<leader>cwd', ':cd %:p:h<CR>:echo "Changed global working directory"<CR>',
    { noremap = true, silent = true, desc = "Change global directory" })
vim.api.nvim_set_keymap('n', '<leader>cwdt', ':tcd %:p:h<CR>:echo "Changed tab working directory"<CR>',
    { noremap = true, silent = true, desc = "Change tab directory" })
vim.api.nvim_set_keymap('n', '<leader>cwdw', ':lcd %:p:h<CR>:echo "Changed window working directory"<CR>',
    { noremap = true, silent = true, desc = "Change window directory" })
vim.api.nvim_set_keymap('n', '<leader>cwdp', ':pwd<CR>',
    { noremap = true, silent = true, desc = "Print working directory" })

-- Make <C-BS> delete word in insert mode
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', { noremap = true, desc = "Delete word" })
