-- -----------------------
-- Telescope configuration
-- great resource: https://github.com/whatsthatsmell/dots/blob/master/public%20dots/vim-nvim/lua/joel/telescope/init.lua
-- -----------------------

local config = {}

function config.telescope ()
  local home = os.getenv("HOME")
  if not packer_plugins["plenary.nvim"].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end

  if not packer_plugins["popup.nvim"].loaded then
    vim.cmd [[packadd popup.nvim]]
  end

  if not packer_plugins["telescope-fzy-native.nvim"].loaded then
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end

  if not packer_plugins["sql.nvim"].loaded then
    vim.cmd [[packadd sql.nvim]]
  end

  if not packer_plugins["telescope-frecency.nvim"].loaded then
    vim.cmd [[packadd telescope-frecency.nvim]]
  end


  if not packer_plugins["telescope-project.nvim"].loaded then
    vim.cmd [[packadd telescope-project.nvim]]
  end
  if not packer_plugins["telescope-media-files.nvim"].loaded then
    vim.cmd [[packadd telescope-media-files.nvim]]
  end

  if not packer_plugins["telescope-zoxide"].loaded then
    vim.cmd [[packadd telescope-zoxide]]
  end

  require("telescope").load_extension("fzy_native")
  require('telescope').load_extension('file_browser')
  require('telescope').load_extension('command_palette')
  require("telescope").load_extension('frecency')
  require("telescope").load_extension("media_files")
  require("telescope").load_extension("zoxide")

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
    },

    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      frecency = {
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = {"*.git/*", "*/tmp/*"},
        workspaces = {
          ["conf"] = home .. "/.config",
          ["data"] = home .. "/.local/share",
          ["nvim"] = home .. "/.config/nvim",
          ["code"] = home .. "/code",
          ["cpp"] = home .. "/code/cpp",
          ["go"] = home .. "/go/src",
        },
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
end

function config.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input('Rg> '),
  }
end

function config.nvim_config()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim/",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

return config
