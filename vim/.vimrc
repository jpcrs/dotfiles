let mapleader=' ' 
set hlsearch 
set incsearch 
set ignorecase 
set smartcase
set number
set relativenumber 
set scrolloff=15 
set history=100000 
set clipboard=unnamed 
 
" Quit insert mode 
inoremap jj <Esc>
inoremap jk <Esc>
 
" Quit visual mode 
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

" Window operation 
nnoremap <leader>ww <C-W>w
nnoremap <leader>wd <C-W>c 
nnoremap <leader>wj <C-W>j 
nnoremap <leader>wk <C-W>k 
nnoremap <leader>wh <C-W>h 
nnoremap <leader>wl <C-W>l 
nnoremap <leader>ws <C-W>s 
nnoremap <leader>w- <C-W>s 
nnoremap <leader>wv <C-W>v 
nnoremap <leader>w| <C-W>v

" clipboard
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

" Tab navigation
nnoremap tl gt
nnoremap th gT

" Save file
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :vsc workbench.action.files.saveFiles<CR>

" ------------- Editor Specific -------------

" Jump around
nnoremap gd :vsc editor.action.revealDefinition<CR> 
nnoremap gi :vsc editor.action.goToImplementation<CR>
nnoremap gr :vsc references-view.findReferences<CR>
nnoremap gp :vsc editor.action.peekDefinition<CR>
"nnoremap gn :vsc Edit.GoToNextLocation<CR>
"nnoremap gb :vsc Edit.GoToPrevLocation<CR>
"vnoremap gn :vsc Edit.GoToNextLocation<CR>
"vnoremap gb :vsc Edit.GoToPrevLocation<CR>

" Error
nnoremap <leader>ne :vsc editor.action.marker.next<CR>
nnoremap <leader>nE :vsc editor.action.marker.prev<CR>

" project search 
nnoremap <leader>se :vsc workbench.action.quickOpen<CR> 
nnoremap <leader>ss :vsc workbench.action.showCommands<CR> 

" Select Next Occurrence - Current broken in .vimrc, have to set in settings.json with:
    " "vim.normalModeKeyBindingsNonRecursive": [
    "     {
    "         "before": ["<leader>", "d"],
    "         "commands": [
    "             "editor.action.addSelectionToNextFindMatch"
    "         ]
    "     },
    "     {
    "         "before": ["<leader>", "D"],
    "         "commands": [
    "             "editor.action.selectHighlights"
    "         ]
    "     }
    " ],
    " "vim.visualModeKeyBindingsNonRecursive": [
    "     {
    "         "before": ["<leader>", "d"],
    "         "commands": [
    "             "editor.action.addSelectionToNextFindMatch"
    "         ]
    "     },
    "     {
    "         "before": ["<leader>", "D"],
    "         "commands": [
    "             "editor.action.selectHighlights"
    "         ]
    "     }
    " ],
"inoremap <C-d> <Esc>:vsc editor.action.addSelectionToNextFindMatch<CR>
"nnoremap <leader>d :vsc editor.action.addSelectionToNextFindMatch<CR>
"vnoremap <leader>d :vsc editor.action.addSelectionToNextFindMatch<CR>
"inoremap <leader>d :vsc editor.action.addSelectionToNextFindMatch<CR>
"nnoremap <leader>D :vsc editor.action.selectHighlights<CR>
"vnoremap <leader>D :vsc editor.action.selectHighlights<CR>
"inoremap <leader>D :vsc editor.action.selectHighlights<CR>

" Navigation
nnoremap <C-o> :vsc workbench.action.navigateBack<CR>
nnoremap <C-i> :vsc workbench.action.navigateForward<CR>
nnoremap <C-h> :vsc workbench.action.navigateBack<CR>
nnoremap <C-l> :vsc workbench.action.navigateForward<CR>

" use built-in search
nnoremap / :vsc actions.find<CR> 
nnoremap <leader>/ / 

" Breakpoints
nnoremap <leader>bb :vsc editor.debug.action.toggleBreakpoint<CR> 
" nnoremap <leader>bv :vsc Debug.Breakpoints<CR> 
nnoremap <leader>bD :vsc workbench.debug.viewlet.action.removeAllBreakpoints<CR> 
nnoremap <leader>bd :vsc workbench.debug.viewlet.action.disableAllBreakpoints<CR> 
nnoremap <leader>ba :vsc workbench.debug.viewlet.action.enableAllBreakpoints<CR> 
" nnoremap <leader>be :vsc Debug.EnableBreakpoint<CR> 

" Debug
nnoremap <leader>sd :vsc workbench.action.debug.start<CR>
nnoremap <leader>ss :vsc workbench.action.debug.run<CR>

" Build
nnoremap <leader>rb :vsc workbench.action.tasks.build<CR>

" tests
nnoremap <leader>tv :vsc test-explorer.focus<CR> 
nnoremap <leader>ta :vsc dotnet-test-explorer.runAllTests<CR> 
nnoremap <leader>tc :vsc dotnet-test-explorer.runTestInContext<CR> 
nnoremap <leader>tA :vsc dotnet-test-explorer.debugTest<CR> 
" nnoremap <leader>tdc :vsc test-explorer.debug-test-at-cursor<CR> 

" Refactor
nnoremap <leader>re :vsc editor.action.rename<cr>

" Terminal
nnoremap <leader>vt Vy<CR>:vsc workbench.action.terminal.toggleTerminal<CR> 

" NERDTree
nnoremap <leader>ff :NERDTreeFind<CR>
nnoremap <leader>fe :vsc workbench.view.explorer<CR>

" Clear search
nnoremap <leader>cs :nohlsearch<CR>
 
" Manage tabs
nnoremap <leader>q :q<CR>
nnoremap <leader>oq :vsc workbench.action.closeOtherEditors<CR>
nnoremap <leader>Q  :vsc workbench.action.closeAllEditors<CR>
" nnoremap <leader>kt  :vsc Window.KeepTabOpen<CR>

" Duplicate line
nnoremap <leader>dl :vsc editor.action.duplicateSelection<CR>
vnoremap <leader>dl :vsc editor.action.duplicateSelection<CR>

" Expand Selection
nnoremap <leader>vv :vsc editor.action.smartSelect.expand<CR>
vnoremap <leader>vv :vsc editor.action.smartSelect.expand<CR>

" Comment
nnoremap <leader>kc :vsc editor.action.commentLine<CR>
vnoremap <leader>kc :vsc editor.action.commentLine<CR>

" Cursor -- Doesn't work great on vimrc
" nnoremap <C-S-A-h> :vsc cursorColumnSelectLeft<CR>
" nnoremap <C-S-A-j> :vsc cursorColumnSelectUp<CR>
" nnoremap <C-S-A-k> :vsc cursorColumnSelectDown<CR>
" nnoremap <C-S-A-l> :vsc cursorColumnSelectRight<CR>
" nnoremap <C-j> :vsc editor.action.moveLinesDownAction<CR>
" nnoremap <C-k> :vsc editor.action.moveLinesUpAction<CR>