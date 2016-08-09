set nocompatible
syntax on
set background=dark

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
"Plugin 'wincent/command-t'
Plugin 'mtimkovich/command-t'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'croaker/mustang-vim'

call vundle#end()
filetype plugin indent on

colors mustang

set ignorecase
set smartcase
set number
set incsearch
set hlsearch
set linebreak
set autoindent
set showcmd
set hidden
set mouse=a
set scrolloff=5
set ruler
set backspace=indent,eol,start
let mapleader=','

nnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk

set tabstop=4
set shiftwidth=4
set expandtab

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

nnoremap <silent> <leader>b :CommandTMRU<CR>
