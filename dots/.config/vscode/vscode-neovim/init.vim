let mapleader=' '
set hlsearch 
set incsearch 
set ignorecase 
set smartcase
set number
set clipboard+=unnamedplus
set iskeyword+=-

call plug#begin()
Plug 'asvetliakov/vim-easymotion'
Plug 'machakann/vim-sandwich'
call plug#end()

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
	\ {'buns': ["( ", " )"], 'nesting': 1, 'match_syntax': 1, 'input': ['('] },
	\ {'buns': ["[ ", " ]"], 'nesting': 1, 'match_syntax': 1, 'input': ['['] },
	\ {'buns': ["{ ", " }"], 'nesting': 1, 'match_syntax': 1, 'input': ['{'] },
	\ ]
function! StructInput() abort
  let s:StructLast = input('Struct: ')
  if s:StructLast !=# ''
    let struct = printf('%%%s{', s:StructLast)
  else
    throw 'OperatorSandwichCancel'
  endif
  return [struct, '}']
endfunction

if exists('g:vscode')
    highlight OperatorSandwichBuns guifg='#edc41f' gui=underline ctermfg=172 cterm=underline 
    highlight OperatorSandwichAdd guifg='#b1fa87' gui=underline ctermfg=172 cterm=underline
    highlight OperatorSandwichDelete guifg='#b1fa87' gui=standout ctermfg=172 cterm=underline
    highlight OperatorSandwichChange guifg='#b1fa87' gui=standout ctermfg=172 cterm=underline
endif

nnoremap gl <C-6>

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
xnoremap p pgvy

" Tab navigation
nnoremap <C-h> <Cmd>Tabprevious<CR>
nnoremap <C-l> <Cmd>Tabnext<CR>
nnoremap th <Cmd>Tabprevious<CR>
nnoremap tl <Cmd>Tabnext<CR>

" Save file
nnoremap <leader>fs <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <leader>fS <Cmd>call VSCodeNotify('workbench.action.files.saveFiles')<CR>

" Workspace
nnoremap <leader>wa <Cmd>call VSCodeNotify('workbench.action.addRootFolder')<CR>
nnoremap <leader>wc <Cmd>call VSCodeNotify('workbench.action.files.openFolderViaWorkspace')<CR>
nnoremap <leader>wr <Cmd>call VSCodeNotify('workbench.action.removeRootFolder')<CR>
nnoremap <leader>wC <Cmd>call VSCodeNotify('workbench.action.closeFolder')<CR>

" Jump around
nnoremap <C-w>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
" nnoremap gf <Cmd>call VSCodeNotify('editor.action.revealDeclaration')<CR>
nnoremap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
nnoremap gr <Cmd>call VSCodeNotify('references-view.findReferences')<CR>
nnoremap gp <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap gn <Cmd>call VSCodeNotify('goToNextReference')<CR>
vnoremap gn <Cmd>call VSCodeNotify('goToNextReference')<CR>
nnoremap gN <Cmd>call VSCodeNotify('goToPreviousReference')<CR>
vnoremap gN <Cmd>call VSCodeNotify('goToPreviousReference')<CR>

" LSP
nnoremap <leader>le <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap <leader>lE <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap <leader>li <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
nnoremap <leader>lI <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
nnoremap <leader>lne <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
nnoremap <leader>lnE <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
nnoremap <leader>lr <Cmd>call VSCodeNotify('editor.action.rename')<cr>
nnoremap <leader>la <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <leader>lm <Cmd>call VSCodeNotify('editor.action.triggerParameterHints')<CR>
nnoremap <leader>lh <Cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<CR>
nnoremap <leader>ls <Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>
nnoremap <leader>lS <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>
nnoremap <leader>lp <Cmd>call VSCodeNotify('workbench.panel.markers.view.focus')<CR>

" project search 
nnoremap <leader>sr <Cmd>call VSCodeNotify('workbench.action.openRecent')<CR> 
nnoremap <leader>sf <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR> 
nnoremap <leader>se <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR> 
nnoremap <leader>sa <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR> 

" Git
nnoremap <leader>gB <Cmd>call VSCodeNotify('gitlens.toggleFileBlame')<CR>
nnoremap <leader>gd <Cmd>call VSCodeNotify('gitlens.diffWithPrevious')<CR>
nnoremap <leader>gb <Cmd>call VSCodeNotify('gitlens.views.switchToAnotherBranch')<CR>
nnoremap <leader>gc <Cmd>call VSCodeNotify('gitlens.compareWorkingWith')<CR>
nnoremap <leader>gw <Cmd>call VSCodeNotify('gitlens.gitCommands.worktree')<CR>

" Multiple Cursor
nnoremap <leader>d <Cmd>call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>
vnoremap <leader>d <Cmd>call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>
nnoremap <leader>D <Cmd>call VSCodeNotify('editor.action.selectHighlights')<CR>
vnoremap <leader>D <Cmd>call VSCodeNotify('editor.action.selectHighlights')<CR>

" use built-in search
nnoremap / <Cmd>call VSCodeNotify('actions.find')<CR> 
nnoremap <leader>/ / 

" Breakpoints
nnoremap <leader>bb <Cmd>call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR> 
nnoremap <leader>bd <Cmd>call VSCodeNotify('workbench.debug.viewlet.action.removeAllBreakpoints')<CR> 
nnoremap <leader>bD <Cmd>call VSCodeNotify('workbench.debug.viewlet.action.disableAllBreakpoints')<CR> 
nnoremap <leader>be <Cmd>call VSCodeNotify('workbench.debug.viewlet.action.enableAllBreakpoints')<CR> 

" Debug
nnoremap <leader>sD <Cmd>call VSCodeNotify('workbench.action.debug.start')<CR>
nnoremap <leader>sd <Cmd>call VSCodeNotify('workbench.action.debug.run')<CR>

" Build
nnoremap <leader>sb <Cmd>call VSCodeNotify('workbench.action.tasks.build')<CR>

" tests
nnoremap <leader>tv <Cmd>call VSCodeNotify('test-explorer.focus')<CR> 
nnoremap <leader>tr <Cmd>call VSCodeNotify('dotnet-test-explorer.runAllTests')<CR> 
nnoremap <leader>tc <Cmd>call VSCodeNotify('dotnet-test-explorer.runTestInContext')<CR> 
nnoremap <leader>tA <Cmd>call VSCodeNotify('dotnet-test-explorer.debugTest')<CR> 
" nnoremap <leader>tC <Cmd>call VSCodeNotify('test-explorer.debug-test-at-cursor')<CR>

" File Tree
nnoremap <leader>fe <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>

" Clear search
nnoremap <leader>cs :nohlsearch<CR>

" Manage tabs
nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>kt <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>
nnoremap <leader>Q <Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>


" Expand Selection
"nnoremap <leader>vv vaf<CR>
"vnoremap <leader>vv af<CR>

" Comment
vnoremap <leader>kc <Plug>VSCodeCommentary
nnoremap <leader>kc <Plug>VSCodeCommentaryLine

" Leetcode
nnoremap <leader>Ls <Cmd>call VSCodeNotify('leetcode.searchProblem')<CR>
nnoremap <leader>Lp <Cmd>call VSCodeNotify('leetcode.showProblem')<CR>
nnoremap <leader>Lh <Cmd>call VSCodeNotify('leetcode.showSolution')<CR>
nnoremap <leader>Lt <Cmd>call VSCodeNotify('leetcode.testSolution')<CR>
nnoremap <leader>Lv <Cmd>call VSCodeNotify('leetCodeExplorer.focus')<CR>

" FSharp
nnoremap <leader>fi <Cmd>call VSCodeNotify('fsi.SendSelection')<CR>
nnoremap <leader>fo <Cmd>call VSCodeNotify('fsi.SendFile')<CR>
nnoremap <leader>fl <Cmd>call VSCodeNotify('fsi.SendLine')<CR>
vnoremap <leader>fi <Cmd>call VSCodeNotify('fsi.SendSelection')<CR>
vnoremap <leader>fo <Cmd>call VSCodeNotify('fsi.SendFile')<CR>
vnoremap <leader>fl <Cmd>call VSCodeNotify('fsi.SendLine')<CR>

" Jump
" nnoremap <leader>j <Cmd>call VSCodeNotify('findJump.activate')<CR> -- Doesn't work with vscode neovim

" Side bar visibility
nnoremap <leader>vs <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

" Error Lens
nnoremap <leader>el <Cmd>call VSCodeNotify('errorLens.toggle')<CR>

" Cursor -- Doesn't work great on vscode vim
" nnoremap <C-A-k> <Cmd>call VSCodeNotify('editor.action.insertCursorAbove')<CR>
" nnoremap <C-A-j> <Cmd>call VSCodeNotify('editor.action.insertCursorBelow')<CR>
" inoremap <C-A-k> <Cmd>call VSCodeNotify('editor.action.insertCursorAbove')<CR>
" inoremap <C-A-j> <Cmd>call VSCodeNotify('editor.action.insertCursorBelow')<CR>
" vnoremap <C-A-k> <Cmd>call VSCodeNotify('editor.action.insertCursorAbove')<CR>
" vnoremap <C-A-j> <Cmd>call VSCodeNotify('editor.action.insertCursorBelow')<CR>
" nnoremap <A-j> <Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>
" nnoremap <A-k> <Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>

" Which key
nnoremap <leader> <Cmd>call VSCodeNotify('whichkey.show')<CR>
vnoremap <leader> <Cmd>call VSCodeNotify('whichkey.show')<CR>