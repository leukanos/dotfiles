local nocode = function()
  return vim.fn.exists('g:vscode') == 0
end

local vscode = vim.g.vscode

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd [[packadd packer.nvim]]

local packer_bootstrap = ensure_packer()

local autopairs_config = require('plugins/autopairs-config')
local copilot_config = require('plugins/copilot')
local mason_config = require('plugins/mason-config')
local null_ls_config = require('plugins/null-ls-config')
local telescope_config = require('plugins/telescope-config')
local treesitter_config = require('plugins/treesitter-config')
local trouble_config = require('plugins/trouble-config')

require('colors/kanagawa')
require('plugins/undotree')

-- Require heirline at the end to avoid race conditions
if not vscode then
  require('plugins/cmp-config')
  require('plugins/gitsigns')
  require('plugins/heirline')
end

local packer = require('packer')
local filename
if vscode then
  filename = "packer_compiled_vscode.lua"
else
  filename = "packer_compiled.lua"
end
packer.init({
  compile_path = vim.fn.stdpath('config') .. '/lua/' .. filename,
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'

  use 'lewis6991/impatient.nvim'

  -- Theme
  use 'rebelot/kanagawa.nvim'

  use 'nvim-tree/nvim-web-devicons'

  if not vscode then
    -- Transparent
    use {
      'xiyaowong/nvim-transparent',
      config = function() require('transparent').setup({ enable = true }) end,
    }

    -- Measure startup time
    use {
      'dstein64/vim-startuptime',
      cmd = 'StartupTime',
      opt = true,
    }

    -- Highlight current word
    use {
      'dominikduda/vim_current_word',
      opt = true,
      event = 'BufRead',
      config = function()
        vim.cmd(':let g:vim_current_word#highlight_delay = 250')
        vim.cmd [[ hi CurrentWord gui=none guibg=#5f5f5f]]
        vim.cmd [[ hi CurrentWordTwins gui=none guibg=#5f5f5f]]
      end,
    }

    -- Awesome status bar
    use 'rebelot/heirline.nvim'

    -- Git signs
    use 'lewis6991/gitsigns.nvim'

    -- Commenting
    use 'tpope/vim-commentary'

    -- Automatically adjusts tabstop, softtabstop, shiftwidth, and expandtab
    use 'tpope/vim-sleuth'
  end

  -- Add indentation guides to all lines (including empty lines)
  use {
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    after = "nvim-treesitter",
    config = function()
      require("indent_blankline").setup {
        buftype_exclude = { "terminal" },
        filetype_exclude = { "help", "packer", "dashboard", "neogitstatus", "NvimTree", "Trouble", "TelescopePrompt", "TelescopeResults" },
        show_current_context = true,
        show_current_context_start = true,
        show_current_context_end = true,
        show_end_of_line = true,
        space_char_blankline = " ",
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
    end,
  }

  -- Better pasting
  use 'sickill/vim-pasta'

  -- Vim + tmux navigation
  use 'christoomey/vim-tmux-navigator'

  -- Markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    opt = true,
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    cond = { nocode }
  }

  -- Plenery
  use 'nvim-lua/plenary.nvim'

  -- Better undo
  use 'mbbill/undotree'

  -- Tmux integration

  if not vscode then
    -- Generate ctags
    use 'ludovicchabant/vim-gutentags'

    use 'tmux-plugins/vim-tmux'

    -- Key bindings help
    use {
      'folke/which-key.nvim',
      keys = ',',
      config = function() require('which-key').setup() end,
    }

    use {
      'folke/trouble.nvim',
      opt = false,
      cmd = 'TroubleToggle',
      module_pattern = 'trouble.*',
      config = trouble_config,
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      opt = true,
      cmd = 'Telescope',
      module_pattern = 'telescope.*',
      config = telescope_config.telescope,
      requires = { { 'nvim-lua/popup.nvim', opt = true }, { 'nvim-lua/plenary.nvim' } },
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      opt = true,
      run = 'make',
    }
    use {
      'nvim-telescope/telescope-project.nvim',
      opt = true,
      after = 'telescope.nvim',
    }
    use {
      'nvim-telescope/telescope-frecency.nvim',
      opt = true,
      after = 'telescope.nvim',
      requires = { { 'tami5/sql.nvim', opt = true } },
    }
    use {
      'nvim-telescope/telescope-media-files.nvim',
      opt = true,
      after = 'telescope.nvim',
    }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'LinArcX/telescope-command-palette.nvim' }

    -- FZF
    use { 'junegunn/fzf', run = ':call fzf#install()' }
    use 'junegunn/fzf.vim'
    use 'gfanto/fzf-lsp.nvim'

    -- CMP and completion plugins
    use {
      'neovim/nvim-lspconfig',
      opt = true,
      event = 'BufReadPre',
    }
    use {
      'glepnir/lspsaga.nvim',
      opt = true,
      after = 'nvim-lspconfig',
      config = function() require('lspsaga').setup({ ui = { theme = 'round' } }) end
    }
    use {
      'SmiteshP/nvim-navic',
    }

    -- Code completion

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
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    use {
      'windwp/nvim-autopairs',
      config = autopairs_config,
      event = "InsertEnter",
    }

    use 'ray-x/lsp_signature.nvim'

    -- Golang support

    use {
      'fatih/vim-go',
      ft = { 'go' },
      opt = true,
      run = ':GoUpdateBinaries',
      config = function()
        vim.cmd(':let g:go_fmt_command = "goimports"')
        vim.cmd('let g:go_fmt_autosave = 1')
        vim.cmd('let g:go_highlight_functions = 1')
        vim.cmd('let g:go_highlight_methods = 1')
        vim.cmd('let g:go_highlight_structs = 1')
        vim.cmd('let g:go_highlight_operators = 1')
      end
    }

    -- LSP servers manager

    use {
      'williamboman/mason.nvim',
      opt = true,
      module = "mason",
      cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
        "MasonUpdate", -- astronvim command
        "MasonUpdateAll", -- astronvim command
      },
      config = function() require('mason').setup() end
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      opt = true,
      after = 'nvim-lspconfig',
      config = mason_config.mason_lspconfig
    }

    use {
      'jay-babu/mason-null-ls.nvim',
      opt = true,
      after = 'null-ls.nvim',
      config = mason_config.mason_null_ls
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      after = 'mason-lspconfig.nvim',
      module = "null-ls",
      config = null_ls_config
    }
  end

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


  -- Autotag - auto close html tags
  use {
    'windwp/nvim-ts-autotag',
    opt = true,
    after = 'nvim-treesitter',
    config = function() require('nvim-ts-autotag').setup() end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugdfasdfins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
