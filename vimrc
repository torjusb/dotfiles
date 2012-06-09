" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
colorscheme Tomorrow-Night

" Phatogen
call pathogen#infect()
call pathogen#helptags() " Make :help work for bundles

set number
set guifont=Monaco:h14
set enc=utf8
set smartindent
set autoindent
set ruler
set showcmd
set laststatus=2
set ignorecase
set smartcase
set go-=T
set mouse=a
set colorcolumn=80

" Tabs, spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Show hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Exit insert mode with jj
inoremap jj <ESC>

" Powerline
let g:Powerline_symbols = 'fancy'

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
