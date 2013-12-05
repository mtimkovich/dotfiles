runtime! archlinux.vim
syntax on
set background=dark

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" Repos on github
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-markdown'
Bundle 'drmingdrmer/xptemplate'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'jnwhiteh/vim-golang'

Bundle 'mtimkovich/Buffet.vim'
Bundle 'mtimkovich/JavaRun'
Bundle 'mtimkovich/Comment'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'SearchComplete'
" Bundle 'taglist.vim'

filetype plugin indent on

set t_Co=256
" Check if we're in a tty
" if $DISPLAY == ""
" 	colorscheme motus
" else
" 	colorscheme eclipse2
" endif

if &background == "dark"
    colors mustang
else
    colors default
endif

" GVim
if has("gui_running")
    colors eclipse
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guifont=Inconsolata\ Medium\ 12
endif

set ignorecase
set smartcase
set number
set incsearch
set hlsearch
set linebreak
set autoindent
set smartindent
set showtabline=1

set wildmode=longest,list
set wildmenu

" Disable Autocommenting
" set fo-=o
" set fo-=r
" set fo-=t

set showcmd
set autowrite
set hidden  
set mouse=a
set history=1000
set scrolloff=20
set ruler
set backspace=indent,eol,start
set shortmess=atI
set autochdir
set viminfo='20,<50,s10,h,%
let mapleader = ","
set cmdheight=2

set backupdir=~/.vim-tmp,/tmp
set directory=~/.vim-tmp,/tmp

" control-t to open a new tab
" noremap <C-t> <Esc>:tabnew<CR>

" map arrow keys to switching between tabs
noremap <LEFT> gT
noremap <RIGHT> gt

" map arrow keys to switching between windows
noremap <UP> <C-w>w
noremap <DOWN> <C-w>W

noremap <C-c> <Esc>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

vnoremap @q :normal @q<CR>

" Turn spellchecking on for .tex files
" au FileType tex set spell
au FileType tex set textwidth=80
au FileType tex set formatoptions=t1
au FileType tex noremap Q gqap

noremap j gj
noremap k gk

" Quicked movements through files
noremap J 10j
noremap K 10k

" Turn off highlighting
nnoremap <silent> <leader>n :silent :nohlsearch<CR>

" Insert New Line Without Entering Insert Mode
nnoremap <C-J> o<Esc>
nnoremap <C-K> O<Esc>

" Save as Root
com! -range -nargs=* W w !sudo tee %

" FuzzyFinder
nnoremap <silent> <C-f> :FufFile<CR> 
" Reload Cache
command -bar R :FufRenewCache

" Insert Filename
inoremap \fn <C-R>=expand("%:t:r")<CR>

" Set the make command for different filetypes
"au FileType c set makeprg=gcc\ -g\ -std=c99\ -o\ %<\ %
au FileType c set makeprg=gcc\ -g\ -o\ %<\ %
au FileType cpp,cc set makeprg=g++\ -o\ %<\ %
au FileType java set makeprg=javac\ %
au FileType coffee set makeprg=coffee\ -c\ %
au FileType go set makeprg=go\ build\ %
au FileType fortran set makeprg=gfortran\ -ffree-form\ -o\ %<\ %
au FileType scala set makeprg=scalac\ %
au FileType markdown set makeprg=markdown\ %\ >\ /tmp/%.html
au FileType haskell set makeprg=ghc\ --make\ %<

" Create templates!
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

" Set markdown tabwidth to 4
au FileType markdown set shiftwidth=4 | set softtabstop=4 | set tabstop=4 

" Coffeescript
hi link coffeeSpaceError NONE

" Set cursor to start position after dot
nnoremap . .`[

" Undo persists accross sessions
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Supertab completion type "Keywords in current file"
" let g:SuperTabDefaultCompletionType = "<c-x><c-n>"

" Set the maximum fold level to 1
" set foldnestmax=1
" " Fold on indents
" set foldmethod=indent
" " All folds open by default
" autocmd BufRead,BufEnter * normal zR

" " Toggle fold state between closed and opened. 
" function! ToggleFold() 
"     if foldlevel('.') > 0 
"         if foldclosed('.') < 0 
"             normal zc
"         else 
"             normal zo
"         endif 
"     endif 
" endfunction
" 
" nnoremap <silent> <space> :call ToggleFold()<cr>

" Toggle spell checking 
nnoremap <silent> <leader>s :set spell!<cr>

" Select all
nnoremap <silent> <leader>a ggVG

" Map ; to :
nnoremap ; :

nnoremap <leader>w :NERDTreeTabsToggle<cr>

nnoremap <C-h> <C-W>w

" let g:easytags_auto_highlight = 0
" 
set tags=./tags;
" let g:easytags_dynamic_files = 2

noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Global replace the word under the cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>

" Buffers
noremap <silent> gn :bn<cr>
noremap <silent> gp :bp<cr>
" noremap <silent> <leader>b :ls<cr>
nnoremap <silent> <leader>b :Bufferlist<CR> 

let g:buffetbareview = 1
