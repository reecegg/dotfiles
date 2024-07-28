return {
  '0x00-ketsu/autosave.nvim',
  -- lazy-loading on events
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require('autosave').setup {}
  end
}
