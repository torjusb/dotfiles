" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
colorscheme Tomorrow-Night

" Phatogen
call pathogen#infect()

set number
set guifont=Menlo:h14
set enc=utf8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set ruler
set showcmd
set laststatus=2
set ignorecase
set smartcase
set go-=T
set mouse=a

" Show hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Color status bar of current split
hi StatusLine guifg=#CD5907 guibg=fg
hi StatusLineNC guifg=#808080 guibg=#080808

"hi Normal ctermbg=black ctermfg=080808

"Exit insert mode with jj
inoremap jj <ESC>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
