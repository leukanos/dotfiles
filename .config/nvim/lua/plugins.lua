local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local autopairs_config = require('plugins/autopairs-config')
local neotree_config = require('plugins.neotree-config')
local telescope_config = require('plugins.telescope-config')
local treesitter_config = require('plugins/treesitter-config')
local nvim_lspconfig = require('plugins/nvim-lspconfig')
local lightbulb_config = require('plugins/lightbulb-config')

require('colors/kanagawa')
require('plugins/undotree')
local copilot_config = require('plugins/copilot')
require('plugins/cmp-config')
require('plugins/gitsigns')

-- Require heirline at the end to avoid race conditions
require('plugins/heirline')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'

  -- Theme
  use 'rebelot/kanagawa.nvim'

  -- Awesome status bar
  use {
    'rebelot/heirline.nvim',
  }

  -- Git signs
  use 'lewis6991/gitsigns.nvim'

  -- Commenting
  use 'tpope/vim-commentary'

  -- Automatically adjusts tabstop, softtabstop, shiftwidth, and expandtab
  use 'tpope/vim-sleuth'

  -- Navigation 
  use {
    'nvim-neo-tree/neo-tree.nvim',
    opt = true,
    cmd = 'Neotree',
    config = neotree_config.neotree,
    requires = {{'kyazdani42/nvim-web-devicons', opt = true}, {'MunifTanjim/nui.nvim', opt = true}}
  }

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

  -- Better pasting
  use 'sickill/vim-pasta'

  -- Vim + tmux navigation
  use 'christoomey/vim-tmux-navigator'

  -- Markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    opt = true,
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }

  -- Plenery 
  use 'nvim-lua/plenary.nvim'

  -- Generate ctags
  use 'ludovicchabant/vim-gutentags'

  -- Better undo
  use 'mbbill/undotree'

  -- Tmux integration
  use 'tmux-plugins/vim-tmux'

  -- Key bindings help
  use {
    'folke/which-key.nvim',
    opt = true,
    keys = ',',
    config = function ()
      require('which-key').setup {}
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    opt = true,
    cmd = 'Telescope',
    module_pattern = 'telescope.*',
    config = telescope_config.telescope,
    requires = {{'nvim-lua/popup.nvim', opt = true}, {'nvim-lua/plenary.nvim'}}
  }
  use {
    'nvim-telescope/telescope-fzy-native.nvim',
    opt = true,
    after = 'telescope.nvim'
  }
  use {
    'nvim-telescope/telescope-project.nvim',
    opt = true,
    after = 'telescope.nvim'
  }
  use {
    'nvim-telescope/telescope-frecency.nvim',
    opt = true,
    after = 'telescope.nvim',
    requires = {{'tami5/sql.nvim', opt = true}}
  }
  use {
    'nvim-telescope/telescope-media-files.nvim',
    opt = true,
    after = 'telescope.nvim'
  }
  use {'jvgrootveld/telescope-zoxide', opt = true, after = 'telescope.nvim'}
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'LinArcX/telescope-command-palette.nvim'

  -- FZF
  use { 'junegunn/fzf', run = ':call fzf#install()' }
  use 'junegunn/fzf.vim'
  use 'gfanto/fzf-lsp.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    config = treesitter_config.treesitter
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opt = true,
    after = "nvim-treesitter"
  }
  use {
    "romgrk/nvim-treesitter-context",
    opt = true,
    after = "nvim-treesitter"
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opt = true,
    after = "nvim-treesitter"
  }

  -- CMP and completion plugins
  use {
    'neovim/nvim-lspconfig',
    opt = true,
    event = 'BufReadPre',
    config = nvim_lspconfig
  }
  use {
    'tami5/lspsaga.nvim',
    opt = true,
    after = 'nvim-lspconfig',
  }
  use {
    'SmiteshP/nvim-navic',
    opt = false,
    -- after = 'nvim-lspconfig', -- TODO: still required by hearline
  }
  use {
    'kosayoda/nvim-lightbulb',
    opt = true,
    after = 'nvim-lspconfig',
  }


  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/cmp-look'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'
  use 'ray-x/cmp-treesitter'
  use 'f3fora/cmp-spell'
  use 'delphinus/cmp-ctags'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use {
    'zbirenbaum/copilot.lua',
    opt = true,
    config = copilot_config,
    cmd = 'Copilot',
    event = "InsertEnter",
  }
  use 'zbirenbaum/copilot-cmp'

  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = autopairs_config
  }

  use 'ray-x/lsp_signature.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

