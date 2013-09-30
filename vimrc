set nocompatible

filetype off

call pathogen#infect()
call pathogen#helptags()

set background=dark

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

colorscheme base16-default

set viminfo='100,<50,s10,h,%

set backspace=indent,eol,start

set backupdir=~/.vim/backup
set noswapfile
set undodir=~/.vim/undo

set wildignore+=node_modules,out,.git,.svn,obj-*

set showcmd

set showmatch

set hlsearch
set incsearch

set ignorecase
set smartcase

set encoding=utf-8
set spelllang=en_us

set textwidth=80

set autoread

augroup default
  au!
  au BufReadPost * :DetectIndent
augroup END

augroup chromium
    au!
    au BufEnter ~/projects/chromium/* call SetChromiumOptions()
    au BufEnter ~/projects/chromium/*.cc let b:fswitchdst = 'h'
    au BufEnter ~/projects/chromium/*.cc let b:fswitchlocs = './'
    au BufEnter ~/projects/chromium/*.h let b:fswitchdst = 'cc'
    au BufEnter ~/projects/chromium/*.h let b:fswitchlocs = './'
augroup END

function! SetChromiumOptions()
    setlocal textwidth=80
endfunction

augroup llvm
    au!
    au BufEnter ~/projects/llvm/* call SetLLVMOptions()
    au BufEnter ~/projects/llvm/*.cpp let b:fswitchdst = 'h'
    au BufEnter ~/projects/llvm/*.cpp let b:fswitchlocs = 'reg:|lib|include/clang|,reg:/lib/include/,./'
    au BufEnter ~/projects/llvm/*.h let b:fswitchdst = 'cpp'
    au BufEnter ~/projects/llvm/*.h let b:fswitchlocs = 'reg:|include/clang|lib|,reg:/include/lib/,./'
augroup END

function! SetLLVMOptions()
    setlocal textwidth=80
endfunction

augroup firebird
    au!
    au BufEnter ~/projects/bv/firebird/* call SetFirebirdOptions()
    au BufEnter ~/projects/memoryhub/* call SetFirebirdOptions()
augroup END

function! SetFirebirdOptions()
    setlocal textwidth=0
endfunction

set cc=+1

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

let g:DeleteTrailingWhitespace = 0
let g:DeleteTrailingWhitespace_Action = 'delete'

let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_expandtab = 1

let mapleader=","

map <silent> <leader>n :NERDTreeToggle<cr>
map <silent> <leader>f :NERDTreeFind<cr>
map <silent> <leader>h :nohls<cr>
map <silent> <leader>a :FSHere<cr>

let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:NERDTreeAutoDeleteBuffer=1

let g:CommandTMaxFiles=100000

let g:markdown_fenced_languages = ["javascript"]

" Highlight trailing whitespace
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

syntax on

filetype plugin indent on
