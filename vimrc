" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
colorscheme Badwolf

" Phatogen
call pathogen#infect()
call pathogen#helptags() " Make :help work for bundles

" Leader
let mapleader = ","

set guifont=Menlo\ for\ Powerline:h12
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
set guioptions-=rL
set fillchars=diff:⣿,vert:│
set listchars=tab:▸\ ,eol:¬
set backspace=indent,eol,start

" Tabs, spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Natural split opening positions
set splitbelow
set splitright

" Exit insert mode with jj
inoremap jj <ESC>

" Go to function-defintion. Can't hit <C-]> with non-US layout :(
nmap ø <C-]>

" Additional colors
hi VertSplit        guibg=#252525 guifg=#5D6268 ctermbg=234 ctermfg=8
hi LineNr           guibg=#252525 guifg=#5D6268 ctermbg=234 ctermfg=7
hi ColorColumn      guibg=gray17                ctermbg=8
hi SyntasticErrorSign                                       ctermfg=160
hi SyntasticWarningSign                                     ctermfg=226

" Syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Tabs
nnoremap ( :tabprev<cr>
nnoremap ) :tabnext<cr>

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2

" Tagbar
nnoremap <leader>s :TagbarToggle<CR>

" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Timeouts
set timeoutlen=350
set ttimeout
set ttimeoutlen=100

" Completion {{{

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set wildmenu
set wildmode=list:longest
set completeopt=menu

set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.luac " Lua byte code
set wildignore+=*.orig " Merge resolution files

" }}}

" Backups {{{

set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set noswapfile " It's 2012, Vim.
" Vagrant NFS shared folder doesn't like it?!
"set backup " enable backups

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
