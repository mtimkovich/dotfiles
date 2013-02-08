if exists( "loaded_comment" )
    finish
endif
let loaded_comment = 1

" Easiy Comment/UnComment
au FileType haskell,vhdl,ada,lua let b:comment_leader = '-- '
au FileType lisp,scheme let b:comment_leader = '; '
au FileType fortran let b:comment_leader = '! '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java,php,javascript,go,scala let b:comment_leader = '// '
au FileType slim,haml let b:comment_leader = '/ '
au FileType sh,make,python,perl,ruby,coffee let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '

noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>
