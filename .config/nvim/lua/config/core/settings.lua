-- Compatibility and functionality
vim.opt.compatible = false             -- Enable features that require 'nocompatible'.
vim.cmd('filetype plugin indent on')   -- Enable filetype detection, plugins, and indent.

-- Colors
-- vim.cmd('syntax enable')               -- Enable syntax highlighting.
vim.opt.redrawtime = 10000             -- Sets maximum time spent trying to highlight
vim.opt.termguicolors = true           -- Enable 24bit color (True color).
vim.opt.background = 'dark'            -- Set background theme (used by some themes).

-- Indentation
vim.opt.tabstop = 4                    -- Number of visual spaces per tab.
vim.opt.softtabstop = 4                -- Number of spaces in tab when editing.
vim.opt.shiftwidth = 4                 -- Number of spaces used for autoindent.
vim.opt.expandtab = true               -- Tabs are expanded to spaces.
vim.opt.smarttab = true                -- Enable backspacing through spaces like they were tabs.
vim.opt.autoindent = true              -- Automatic indentation.
vim.opt.copyindent = true              -- Indentation copied from the previous line.
vim.opt.smartindent = true             -- Smart indentation.

-- User Interface
vim.opt.hidden = true                  -- Files are hidden instead of closed when opening another.
vim.opt.number = true                  -- Show line numbers.
vim.opt.relativenumber = false         -- Show relative line numbers.
vim.opt.showcmd = false                -- Don't show command in the bottom bar.
vim.opt.cursorline = true              -- Highlight the current line.
vim.opt.cursorcolumn = false           -- Don't highlight the current column.
vim.opt.wildmenu = true                -- Enable visual autocomplete for command menu.
vim.opt.wildmode = {'list:longest', 'full'} -- Mode info and space used by wildmenu.
vim.opt.showmatch = true               -- Highlight matching braces.
vim.opt.laststatus = 2                 -- Windows will always have a status line.
vim.opt.wrap = false                   -- Don't wrap lines.
vim.opt.list = false                   -- Don't show non-print characters by default.
vim.opt.listchars = {                  -- Customize list characters.
    eol = '¬',
    tab = '¦\\ ',
    space = '·',
    extends = '»',
    precedes = '«',
    trail = '•',
    nbsp = '␣'
}
vim.opt.splitbelow = true              -- Horizontal splits below current.
vim.opt.splitright = true              -- Vertical splits to right of current.
vim.opt.scrolloff = 5                  -- Always show next 5 lines.
vim.opt.sidescrolloff = 10             -- Always show next 10 characters.
vim.opt.sidescroll = 1                 -- Scroll sideways one character at a time.
vim.opt.startofline = false            -- Don't jump to the first character with page commands.
vim.opt.ruler = true                   -- Enable line/col number on the status bar.
vim.opt.colorcolumn = "119"               -- Set no color columns.
vim.opt.showmode = false               -- Don't show -- insert -- etc. text.
vim.opt.showtabline = 2                -- Always show tabline even when there is only one.

-- Search
vim.opt.incsearch = true               -- Search as characters are entered.
vim.opt.hlsearch = false               -- Disable highlight search matches.
vim.opt.ignorecase = true              -- Ignore case when searching.
vim.opt.smartcase = true               -- Ignore case if search pattern is lowercase, otherwise case-sensitive.
vim.opt.shortmess:append('c')          -- Don't show completion messages like 'match 1 of 2' or 'The only match'.

-- Functionality
vim.opt.joinspaces = false             -- Prevents inserting two spaces after punctuation on a join.
vim.opt.backspace = {'indent', 'eol', 'start'} -- Let backspace go indention, line breaks, and though text from before the current insert.
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.timeoutlen = 300               -- Milliseconds to wait for mapped sequence to complete.
vim.opt.ttimeoutlen = 5                -- Milliseconds to wait for key code sequence to complete.
vim.opt.virtualedit = ''               -- Set no virtual edit.
vim.opt.updatetime = 100               -- Delay before CursorHold triggers.
vim.opt.guicursor = ""                 -- Disable GUI cursor.

-- Swap and Backup
vim.opt.swapfile = false               -- Don't use swapfile.
vim.opt.backup = false                 -- Don't create backup files.
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir" -- Set undo directory.
vim.opt.undofile = true                -- Enable persistent undo.

-- Autoread
vim.opt.autoread = true                -- Reload file when changed outside vim.
-- Check for autoread changes on terminal focus, buffer change, and cursor stop.
vim.cmd([[
augroup auto_read
    autocmd!
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
augroup END
]])
