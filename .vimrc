scriptencoding utf-8
set encoding=utf-8
set nocompatible
set background=dark
syntax enable
colorscheme monokai

" Keep at least 5 lines anove or below the cursor
set scrolloff=5

" Show line numbers
set number
set autoindent
set smarttab
set mouse=a

set tabstop=2
set shiftwidth=2
set softtabstop=2

" Use space as a <leader>
let mapleader=' '

call plug#begin('~/.config/nvim/site/autoload')
Plug 'junegunn/vim-plug'

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fa <cmd>Telescope commands<cr>

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' " NerdTree

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

Plug 'ryanoasis/vim-devicons' " Developer Icons

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'tmux-plugins/vim-tmux'

call plug#end()

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

lua require('config')
