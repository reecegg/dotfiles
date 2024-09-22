return {
  "hedyhli/markdown-toc.nvim",
  ft = "markdown", -- Lazy load on markdown filetype
  config = function()
    require("mtoc").setup({
      auto_update = false,
      headings = {
        -- Include headings before the ToC
        -- General style perference and to align with the big three editors (VSCode, IntelliJ, Vim)
        before_toc = true,
      },
      fences = {
        enabled = true,

        -- Align with least configuration of the big three editors (VSCode, IntelliJ, Vim)
        -- VScode doesn't need fences, Vim needs them and allows configuration, IntelliJ needs them but doesn't allow configuration
        start_text = "TOC",
        end_text = "TOC"
      },
      toc_list = {

        -- Align with least configuration (IntelliJ) of the big three editors (VSCode, IntelliJ, Vim)
        -- Vim allows advanced configuration, VSCode allows basic configuration, IntelliJ doesn't allow configuration
        markers = { '*' },
        cycle_markers = false,

        -- item_formatter = function(item_info, fmtstr)
        --   -- Calculate the correct indent based on the heading level
        --   local indent_level = math.max(0, item_info.level - 1)
        --   item_info.indent = string.rep("  ", indent_level)
        --   local s = fmtstr:gsub([[${(%w-)}]], function(key)
        --     return item_info[key] or ('${' .. key .. '}')
        --   end)
        --   return s
        -- end,
      }
    })
  end,
}
