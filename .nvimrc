let mapleader=' ' 
set hlsearch 
set incsearch 
set ignorecase 
set smartcase
set number
set relativenumber 
set scrolloff=15 
set clipboard=unnamed 
 
" Tab navigation
nnoremap tl gt
nnoremap th gT

" NERDTree
nnoremap <leader>ff :NERDTreeFind<CR>

" Clear search
nnoremap <leader>cs :nohlsearch<CR>
 
" Save file
nnoremap <leader>fs :w<CR>
 
" Quit normal mode 
nnoremap <leader>q  :q<CR>
 
" Quit insert mode 
inoremap jj <Esc>
inoremap jk <Esc>
 
" Quit visual mode 
vnoremap v <Esc>
 
" Move to the start of line 
nnoremap H ^
 
" Move to the end of line 
nnoremap L $
 
" Redo
nnoremap U <C-r>
 
" Yank to the end of line 
nnoremap Y y$
 
" Tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Window operation 
nnoremap <leader>ww <C-W>w
nnoremap <leader>wd <C-W>c
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l
nnoremap <leader>ws <C-W>s
nnoremap <leader>wv <C-W>v

" clipboard
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap s "_s
noremap S "_S
noremap c "_c
noremap C "_C
nnoremap x "_x
nnoremap X "_x