-- ----------------
-- Tresitter config 
-- ----------------

local config = {}

function config.nvim_treesitter()
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
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true
    },

    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      -- Automatically jump forward from end of textobj, similar to targets.vim
      keymaps = {
	-- You can use the capture groups defined in textobjects.scm
	["af"] = "@function.outer",
	["if"] = "@function.inner",
	["ac"] = "@class.outer",
	["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
	["]m"] = "@function.outer",
	["]]"] = "@class.outer",
      },
      goto_next_end = {
	["]M"] = "@function.outer",
	["]["] = "@class.outer",
      },
      goto_previous_start = {
	["[m"] = "@function.outer",
	["[["] = "@class.outer",
      },
      goto_previous_end = {
	["[M"] = "@function.outer",
	["[]"] = "@class.outer",
      },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return config
