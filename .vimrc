set nocompatible
syntax on
set background=dark

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-commentary'
Bundle 'wellle/targets.vim'
Bundle 'posva/vim-vue'
Bundle 'ervandew/supertab'
Bundle 'tmhedberg/matchit'
Bundle 'rust-lang/rust.vim'
Bundle 'vim-python/python-syntax'
Bundle 'tpope/vim-surround'

" Colors
Plugin 'croaker/mustang-vim'
Plugin 'vim-scripts/ibmedit.vim'

call vundle#end()
filetype plugin indent on

colors mustang
" colors ibmedit

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
set colorcolumn=80
autocmd FileType go,rust,markdown set colorcolumn=101
autocmd FileType vue set shiftwidth=2
let mapleader=','

nnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap / /\v
nnoremap ; :
nnoremap j gj
nnoremap k gk
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

vnoremap . :normal .<CR>
vnoremap @ :normal @
noremap <tab> %

nnoremap <Leader>* :%s/\<<C-r><C-w>\>//g<left><left>

set tabstop=4
set shiftwidth=4
set expandtab

if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

nnoremap <silent> <leader>b :CommandTMRU<CR>

setlocal completeopt-=preview

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Insert filename
inoremap \fn <C-R>=expand("%:t:r")<CR>

" Map _ to beginning of line
noremap _ ^

" Yank to system clipboard
noremap <leader>y "+y

" Put yanked text
noremap <leader>p "0p
noremap <leader>P "0P

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

noremap <silent> <space> :Commentary<cr>

" Language specific settings
augroup golang
    au!
    au FileType go set noexpandtab
augroup END
