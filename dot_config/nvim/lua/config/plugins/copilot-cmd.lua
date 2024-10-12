-- After setup `:Copilot Auth`
return {
    enabled = false,
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function ()
       require("copilot_cmp").setup()
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = true },
          panel = { enabled = true },
        })
      end
    }
  }
