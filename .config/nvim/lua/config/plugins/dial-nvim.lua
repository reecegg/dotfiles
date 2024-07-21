return {
   'monaqa/dial.nvim',
   config = function()
      local dial = require('dial.map')
      vim.keymap.set("n", "<C-a>", function() dial.manipulate("increment", "normal") end)
      vim.keymap.set("n", "<C-x>", function() dial.manipulate("decrement", "normal") end)
      vim.keymap.set("n", "g<C-a>", function() dial.manipulate("increment", "gnormal") end)
      vim.keymap.set("n", "g<C-x>", function() dial.manipulate("decrement", "gnormal") end)
      vim.keymap.set("v", "<C-a>", function() dial.manipulate("increment", "visual") end)
      vim.keymap.set("v", "<C-x>", function() dial.manipulate("decrement", "visual") end)
      vim.keymap.set("v", "g<C-a>", function() dial.manipulate("increment", "gvisual") end)
      vim.keymap.set("v", "g<C-x>", function() dial.manipulate("decrement", "gvisual") end)

    -- Import dial module
    local augend = require("dial.augend")

    -- Define a list of augends
    local augends = {
        augend.integer.alias.decimal, -- Decimal numbers
        augend.integer.alias.hex,     -- Hexadecimal numbers
        augend.date.alias["%Y/%m/%d"], -- Dates in Year/Month/Day format
        augend.constant.alias.bool,    -- Booleans (true/false)
        augend.constant.new {
            elements = {"yes", "no"},
            word = true,
        },
        augend.constant.new {
            elements = {"Yes", "No"},
            word = true,
        },
        augend.constant.new {
            elements = {"YES", "NO"},
            word = true,
        },
        augend.constant.new {
            elements = {"True", "False"},
            word = true,
        },
        augend.constant.new {
            elements = {"TRUE", "FALSE"},
            word = true,
        }
    }

    -- Add augends to the default group
    require("dial.config").augends:register_group{
        default = augends
    }
       end,
    }
