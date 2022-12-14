" Go to last buffer
nnoremap gl <C-6>

" Quit visual mode with ESC
vnoremap v <Esc>
 
" Move to the start of line 
nnoremap H ^
vnoremap H ^
 
" Move to the end of line 
nnoremap L $
vnoremap L $
 
" Redo
nnoremap U <C-r>
 
" Yank to the end of line 
nnoremap Y y$
 
" Tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Clipboard
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
nnoremap s "_s
nnoremap S "_S
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
nnoremap x "_x
nnoremap X "_x
xnoremap p pgvy