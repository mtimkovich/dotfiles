set guifont=JetBrains\ Mono\:h11

call plug#begin(stdpath('config') . '/plugged')

Plug 'airblade/vim-rooter'
Plug 'atweiden/vim-fennel'
Plug 'dag/vim-fish'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jvirtanen/vim-hcl'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'vim-python/python-syntax'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'bullets-vim/bullets.vim'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plug 'arcticicestudio/nord-vim'
Plug 'croaker/mustang-vim'
Plug 'vim-scripts/ibmedit.vim'

call plug#end()
filetype plugin indent on

colors mustang

let g:python3_host_prog = '/usr/bin/python3'

set hidden

set ignorecase
set linebreak
set mouse=a
set number

" set relativenumber
" au! InsertLeave * set relativenumber
" au! InsertEnter * set relativenumber!

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

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Cutlass
nnoremap m d
xnoremap m d
nnoremap mm dd

noremap M m

let g:yoinkIncludeDeleteOperations = 1

noremap <c-n> <plug>(YoinkPostPasteSwapBack)
noremap <c-p> <plug>(YoinkPostPasteSwapForward)

noremap p <plug>(YoinkPaste_p)
noremap P <plug>(YoinkPaste_P)

nnoremap <silent> <leader>n :nohlsearch<CR>
nnoremap ; :
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap <cr> o<esc>

vnoremap . :normal .<CR>
vnoremap @ :normal @
noremap Q @q

setlocal completeopt-=preview

set undofile
set undolevels=1000
set undoreload=10000

" Insert filename
inoremap \fn <C-R>=expand("%:t:r")<CR>

nnoremap <silent> <leader>t :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Map _ to beginning of line
noremap _ ^

" Yank to system clipboard
noremap <leader>y "+y

" Put system clipboard
inoremap <c-s-v> <c-r>+

" Put system text
noremap <leader>p "+p
noremap <leader>P "+P

" Toggle spellcheck
noremap <silent> <leader>s :set spell!<CR>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Commentary
noremap <silent> <space> :Commentary<cr>
autocmd FileType hcl setlocal commentstring=#\ %s
autocmd FileType autohotkey setlocal commentstring=;\ %s

" Language specific settings
augroup golang
    au!
    au FileType go set noexpandtab
augroup END

" Config syntax highlighting.
autocmd BufEnter,BufRead *.conf,*.toml setf dosini
autocmd BufEnter,BufRead *.star setf python

let g:SuperTabDefaultCompletionType = "<c-n>"

" Rust fmt on save
autocmd BufWritePost *.rs silent! :!cargo fmt
autocmd BufWritePre *.go :GoFmt

" Open config
command Config :exe "edit" stdpath("config")."/init.vim"
