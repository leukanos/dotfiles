scriptencoding utf-8
set encoding=utf-8

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

call plug#begin('~/.config/nvim/site/autoload')

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' " NerdTree

Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

Plug 'ryanoasis/vim-devicons' " Developer Icons

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:airline_theme='molokai'
