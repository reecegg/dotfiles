return {
  enabled = true,
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local db = require('dashboard')
    db.setup({
      theme = 'hyper',
      shortcut_type = 'number',  -- Using numbers as shortcuts
      change_to_vcs_root = true, -- Change to the root of VCS on file open
      config = {
        header = {
          '                                                       ',
          '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ',
          '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ',
          '   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ',
          '   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ',
          '   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ',
          '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ',
          '                                                       ',
        },
        shortcut = {
          -- open empty buffer with e
          {
            desc = ' New File',
            group = '@property',
            action = 'enew',
            key = 'e'
          },
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u'
          },
          {
            desc = ' dotfiles',
            group = '@property',
            action = 'edit ~/.config/nvim/',
            key = 'd',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
        },
      },
    })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
