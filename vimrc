set nocompatible

filetype off

call pathogen#infect()
call pathogen#helptags()

set background=dark
let g:solarized_termtrans=1

colorscheme solarized

set viminfo='100,<50,s10,h,%

set backspace=indent,eol,start

set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

set showcmd

set showmatch

set hlsearch
set incsearch

set ignorecase
set smartcase

set encoding=utf-8
set spelllang=en_us

set textwidth=0
set shiftwidth=2
set tabstop=2
set expandtab

augroup chromium
    au!
    au BufEnter ~/projects/chromium/* call SetChromiumOptions()
augroup END

function! SetChromiumOptions()
    setlocal textwidth=80
    setlocal shiftwidth=2
    setlocal tabstop=2
endfunction

augroup firebird
    au!
    au BufEnter ~/projects/bv/firebird/* call SetFirebirdOptions()
    au BufEnter ~/projects/memoryhub/* call SetFirebirdOptions()
augroup END

function! SetFirebirdOptions()
    setlocal textwidth=0
    setlocal shiftwidth=2
    setlocal tabstop=2
endfunction

augroup cpp
    au!
    au BufEnter *.cc let b:fswitchdst = 'h'
    au BufEnter *.cc let b:fswitchlocs = './'
    au BufEnter *.h let b:fswitchdst = 'cc'
    au BufEnter *.h let b:fswitchlocs = './'
augroup END

set cpoptions+=$

set autoindent
set smartindent

set scrolloff=3

set noerrorbells
set visualbell t_vb=

set hidden

set wildmenu

set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
" set statusline+=%2*0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

let mapleader=","

map <silent> <leader>n :NERDTreeToggle<cr>
map <silent> <leader>h :nohls<cr>
map <silent> <leader>a :FSHere<cr>

imap <c-space> <c-x><c-o>

" let g:xptemplate_vars='author=J. Ryan Stinnett&email=jryans@gmail.com'

syntax on

filetype plugin indent on
