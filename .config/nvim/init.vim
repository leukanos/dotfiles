"*****************************************************************************
" Defaults 
"*****************************************************************************

lua require('core/keymaps')

scriptencoding utf-8
set encoding=utf-8
set nocompatible

" -- apperance
set title
set background=dark
set signcolumn=yes
set termguicolors
syntax enable
colorscheme monokai

" -- backspace
set backspace=indent,eol,start

" -- allow autowriteall
set autowriteall
set secure

" -- keep at least 5 lines anove or below the cursor
set clipboard^=unnamed,unnamedplus

" -- line numbers 
set number
set relativenumber

" -- mouse mode
set mouse=a

" -- tabs & indentation
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set smarttab

" -- search settings
set ignorecase
set smartcase

" -- cursor line 
set cursorline

"*****************************************************************************
" Plugins 
"*****************************************************************************

call plug#begin('~/.config/nvim/site/autoload')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'

Plug 'rebelot/kanagawa.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-look'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'ray-x/cmp-treesitter'
Plug 'f3fora/cmp-spell'
Plug 'delphinus/cmp-ctags'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'SmiteshP/nvim-navic'

Plug 'ludovicchabant/vim-gutentags' " Automatically generate ctags

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'rebelot/heirline.nvim'
" Plug 'vim-airline/vim-airline' " Status bar
" Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

Plug 'ryanoasis/vim-devicons' " Developer Icons

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'LinArcX/telescope-command-palette.nvim'

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'tmux-plugins/vim-tmux'
Plug 'github/copilot.vim'

Plug 'lewis6991/gitsigns.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()


"*****************************************************************************
" nvim-cmp
"*****************************************************************************

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword


"*****************************************************************************
lua require('colors/kanagawa')

lua require('plugins/autopairs-config')
lua require('plugins/cmp-config')
lua require('plugins/treesitter-config')
lua require('plugins/gitsigns')
lua require('plugins/neo-tree')
lua require('plugins/heirline')
lua require('plugins/telescope-config')
