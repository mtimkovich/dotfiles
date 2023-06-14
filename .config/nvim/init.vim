call plug#begin(stdpath('config') . '/plugged')

Plug 'airblade/vim-rooter'
Plug 'dag/vim-fish'
Plug 'ervandew/supertab'
" Plug 'fatih/vim-go'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jvirtanen/vim-hcl'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
Plug 'wellle/targets.vim'

" Colors
Plug 'arcticicestudio/nord-vim'
Plug 'croaker/mustang-vim'
Plug 'vim-scripts/ibmedit.vim'

call plug#end()
filetype plugin indent on

colors mustang

let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '/usr/local/lib/ruby/gems/3.0.0/bin/neovim-ruby-host'

set hidden
set ignorecase
set linebreak
set mouse=a
set number

set relativenumber
au! InsertLeave * set relativenumber
au! InsertEnter * set relativenumber!

set scrolloff=5
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
autocmd FileType sh,dosini,json set sw=2
autocmd BufRead,BufNewFile *.star setf python
" set colorcolumn=80
" autocmd FileType go,rust,markdown set colorcolumn=
" autocmd FileType vue set shiftwidth=2
let mapleader=','

nnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap ; :
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

vnoremap . :normal .<CR>
vnoremap @ :normal @
noremap Q @q

" nnoremap <Leader>* :%s/\<<C-r><C-w>\>//g<left><left>
vnoremap <leader>* "hy:%s#<C-r>h##g<left><left>

setlocal completeopt-=preview

set undofile
set undolevels=1000
set undoreload=10000

" Insert filename
inoremap \fn <C-R>=expand("%:t:r")<CR>

nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Map _ to beginning of line
noremap _ ^

" Yank to system clipboard
noremap <leader>y "+y

" Put yanked text
noremap <leader>p "0p
noremap <leader>P "0P

" Toggle spellcheck
noremap <silent> <leader>s :set spell!<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Commentary
noremap <silent> <space> :Commentary<cr>
autocmd FileType hcl setlocal commentstring=#\ %s

" Language specific settings
augroup golang
    au!
    au FileType go set noexpandtab
augroup END

" Config syntax highlighting.
autocmd BufEnter,BufRead *.conf,*.toml setf dosini
autocmd BufEnter,BufRead *.star setf python

let g:SuperTabDefaultCompletionType = "<c-n>"
