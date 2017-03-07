set nocompatible
syntax on
set background=dark

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'wincent/command-t'
Plugin 'mtimkovich/command-t'
Plugin 'tpope/vim-commentary'
Plugin 'skywind3000/asyncrun.vim'
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

vnoremap . :normal .<CR>
vnoremap @ :normal @

set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <space> za
set foldmethod=indent
set foldnestmax=3
set foldlevelstart=20

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

nnoremap <silent> <leader>b :CommandTMRU<CR>

autocmd FileType python let b:dispatch = 'python %:p'

function Run()
    execute 'AsyncRun ' . b:dispatch
endfunction

command Run call Run()
nnoremap <leader>r :Run<CR>
nnoremap <silent> <leader>c :call asyncrun#quickfix_toggle(8)<CR>

