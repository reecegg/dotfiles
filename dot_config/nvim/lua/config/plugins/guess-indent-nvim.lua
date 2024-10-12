-- Alternatives:
-- - https://github.com/Darazaki/indent-o-matic
-- - https://github.com/tpope/vim-sleuth

return {
   'nmac427/guess-indent.nvim',
   config = function() require('guess-indent').setup {} end,
}
