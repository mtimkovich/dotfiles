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
Bundle 'mtimkovich/JavaRun'
Bundle 'mtimkovich/Comment'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

filetype indent on

set t_Co=256
" Check if we're in a tty
if $DISPLAY == ""
	colorscheme motus
else
	colorscheme Mustang_Vim_Colorscheme_by_hcalves
" 	colorscheme eclipse2
endif

" GVim
if has("gui_running")
    colors eclipse
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guifont=Inconsolata\ Medium\ 12
endif

" set nowrap
set ic
set smartcase	
set number
set incsearch
set hlsearch
set linebreak
set autoindent
set smartindent
set showtabline=1

set wildmode=longest,list,full
set wildmenu

" Disable Autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" FuzzyFinder Menu
" highlight Pmenu ctermbg=DarkBlue gui=bold

set showcmd
set autowrite
set hidden  
set mouse=a
" filetype on
" filetype plugin on
set history=1000
set scrolloff=5
" set textwidth=80
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" let g:WriteBackup_BackupDir = '/home/max/.vim-tmp' 
set ruler
set backspace=indent,eol,start
set shortmess=atI
set autochdir
set viminfo='20,<50,s10,h,%
let mapleader = ","

map <C-t> <Esc>:tabnew<CR>
noremap <UP> <C-w>w
noremap <DOWN> <C-w>W
noremap <LEFT> gT
noremap <RIGHT> gt

map <C-c> <Esc>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

vnoremap @q :normal @q<CR>

" Highlight everything right of the 80th column
" highlight rightMargin ctermfg=red guifg=red
" autocmd BufWinEnter * let w:m1=matchadd('rightMargin', '\%>79v', -1)

" Turn spellchecking on for .tex files
" au FileType tex set spell
au FileType tex set textwidth=80
au FileType tex set formatoptions=t1
au FileType tex noremap Q gqap

noremap j gj
noremap k gk

nmap <silent> <leader>n :silent :nohlsearch<CR>

" Cmdline Completion
cmap <Tab> <Plug>CmdlineCompleteBackward

" Insert New Line Without Entering Insert Mode
nnoremap <C-J> o<Esc>
nnoremap <C-K> O<Esc>

" Save as Root
com! -range -nargs=* W w !sudo tee %

" Fuzzy Finder
nnoremap <silent> <C-f> :FufFile<CR> 
" Reload Cache
command -bar R :FufRenewCache

" Insert Filename
inoremap \fn <C-R>=expand("%:t:r")<CR>

au FileType c set makeprg=gcc\ -g\ -o\ %<\ %
au FileType cpp,cc set makeprg=g++\ -o\ %<\ %
au FileType java set makeprg=javac\ %
au FileType coffee set makeprg=coffee\ -c\ %
au FileType go set makeprg=go\ build\ %
au FileType fortran set makeprg=gfortran\ -ffree-form\ -o\ %<\ %
au FileType scala set makeprg=scalac\ %

command -bar Curses :set makeprg=gcc\ -o\ %<\ %\ -lncurses 
command -bar Gtk :set makeprg=gcc\ -o\ %<\ %\ `pkg-config\ --libs\ --cflags\ gtk+-2.0`

" Create templates!
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

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
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"
