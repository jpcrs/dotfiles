" ------------------- Default Configuration -------------------
let mapleader=' ' 
set hlsearch 
set incsearch 
set ignorecase 
set smartcase
set number
set relativenumber 
set scrolloff=15 
set history=100000 
set clipboard=unnamedplus
set iskeyword+=-


" ------------------- Vim default rebindings -------------------

" Go to last buffer
nnoremap gl <C-6>

" Quit visual mode with ESC
vnoremap v <Esc>
 
" Move to the start of line 
nnoremap H ^
vnoremap H ^

" Fix vsvim
nnoremap <C-d> 22j
nnoremap <C-u> 22k
 
" Move to the end of line 
nnoremap L $
vnoremap L $
 
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

" Tab navigation
nnoremap tl gt
nnoremap th gT
nnoremap <C-h> gT
nnoremap <C-l> gt

" ------------------- VSCode commands rebind -------------------
" Jump around
nnoremap <C-w>gd :vsc editor.action.revealDefinitionAside<CR>
"  nnoremap gd :vsc editor.action.revealDefinition<CR> -> Causes a cursor bug
nnoremap gf :vsc editor.action.revealDeclaration<CR>
nnoremap gi :vsc editor.action.goToImplementation<CR>
nnoremap gr :vsc editor.action.referenceSearch.trigger<CR>
nnoremap gR :vsc references-view.findReferences<CR>
nnoremap gp :vsc editor.action.peekDefinition<CR>
vnoremap gn :vsc goToNextReference<CR>
vnoremap gN :vsc goToPreviousReference<CR>
nnoremap gL :vsc workbench.action.navigateToLastEditLocation<CR>
