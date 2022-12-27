"*****************************************************************************
" Defaults 
"*****************************************************************************

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
set relativenumber
set smarttab
set mouse=a

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent

" Use space as a <leader>
let mapleader=' '

"*****************************************************************************
" Plugins 
"*****************************************************************************

call plug#begin('~/.config/nvim/site/autoload')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'

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

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree' " NerdTree

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
Plug 'github/copilot.vim'

Plug 'windwp/nvim-autopairs'

call plug#end()

"*****************************************************************************
" NERDTree
"*****************************************************************************

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

"*****************************************************************************
" telescope
"*****************************************************************************

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fa <cmd>Telescope commands<cr>

lua require('telescope-config')

"*****************************************************************************
" airline
"*****************************************************************************

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

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

lua require('cmp-config')

"*****************************************************************************
lua require('autopairs-config')
lua require('treesitter-config')

