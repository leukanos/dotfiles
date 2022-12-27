-- ----------------
-- Tresitter config 
-- ----------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

	ignore_install = { "verilog", "c_sharp", "tlaplus", "julia" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = { "bash" },  -- list of language that will be disabled
	},

  indent = {
    enable = true
  }

}
