-- ---------
-- Autopairs
-- ---------

local cmp = require'cmp'
require('nvim-autopairs').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it willf auto insert `(` after select function or method items
  auto_select = true, -- automatically select the first item 
  disable_filetype = { "TelescopePrompt" , "vim" },

})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

