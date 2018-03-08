set nocompatible
syntax on
set background=dark

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'

" Colors
Plugin 'croaker/mustang-vim'
Plugin 'vim-scripts/ibmedit.vim'

call vundle#end()
filetype plugin indent on

colors mustang

set ignorecase
set smartcase
set number
set relativenumber
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
set colorcolumn=81
let mapleader=','

nnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk

vnoremap . :normal .<CR>
vnoremap @ :normal @

nnoremap <Leader>* :%s/\<<C-r><C-w>\>//g<left><left>

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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
