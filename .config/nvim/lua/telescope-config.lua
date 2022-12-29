-- -----------------------
-- Telescope configuration
-- great resource: https://github.com/whatsthatsmell/dots/blob/master/public%20dots/vim-nvim/lua/joel/telescope/init.lua
-- -----------------------

local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_position = "top",
    prompt_prefix = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  }
}

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    command_palette = {
      {
        "NVim",
        { "source", ":source %" },
        { "checkhealth", ":checkhealth" },
        { "Browse config", "lua require('telescope-config').nvim_config()" }
      }
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('command_palette')

local M = {}

function M.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input('Rg> '),
  }
end

function M.nvim_config()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim/",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

return M
