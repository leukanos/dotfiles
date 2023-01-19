-- Packer

require('impatient')
require('plugins')

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Global

local o = vim.o

o.autoread = true
o.autowrite = true
o.autowriteall = true
o.compatible = false
o.secure = true
o.syntax = 'enable'
o.timeoutlen = 500

-- vim.cmd('scriptencoding utf-8')
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

-- Apperance

o.background = 'dark'
o.signcolumn = 'yes'
o.termguicolors = true
o.title = true
o.wrap = false
o.textwidth = 100
o.colorcolumn = '100'

vim.cmd([[
  highlight IndentBlanklineChar guifg=#658594 gui=nocombine "kanagawa dragonBlue
  highlight IndentBlanklineSpaceChar guifg=#658594 gui=nocombine "kanagawa dragonBlue
  highlight IndentBlanklineContextChar guifg=#957FB8 gui=nocombine "kanagawa oniViolet
  highlight IndentBlinklineContextSpaceChar guifg=#957FB8 gui=nocombine "kanagawa oniViolet
  highlight IndentBlanklineContextStart guisp=#957FB8 gui=underline
  highlight IndentBlanklineContextEnd guisp=#957FB8 gui=underline
  let g:indent_blankline_context_char = '┃'
]])

-- Search

o.ignorecase = true
o.hlsearch = true
o.smartcase = true

-- Backspace
o.backspace = 'indent,eol,start'

-- Line numbers
o.number = true
o.relativenumber = true

-- Indentation and tabs
o.autoindent = true
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.smarttab = true
o.softtabstop = 2
o.tabstop = 2

-- Clipboard
o.clipboard = 'unnamedplus,unnamed'

-- Mouse
o.mouse = 'a'

-- Cursor
o.cursorline = true
o.cursorcolumn = false

-- Undo 
vim.cmd [[
  let undodir_path = expand('~/.undodir')
  if !isdirectory(undodir_path)
    call mkdir(undodir_path, 'p', 0700)
  endif

  set undodir=~/.undodir
  set undofile
]]

o.undolevels = 1000
o.backup = false
o.swapfile = false

require('core/keymaps')
