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

" Tab navigation
nnoremap tl gt
nnoremap th gT
nnoremap <C-h> gT<CR>
nnoremap <C-l> gt<CR>

" ------------------- VSCode commands rebind -------------------
" Jump around
nnoremap <C-w>gd :vsc editor.action.revealDefinitionAside<CR>
nnoremap gd :vsc editor.action.revealDefinition<CR>
nnoremap gf :vsc editor.action.revealDeclaration<CR>
nnoremap gi :vsc editor.action.goToImplementation<CR>
nnoremap gr :vsc references-view.findReferences<CR>
nnoremap gp :vsc editor.action.peekDefinition<CR>
vnoremap gn :vsc goToNextReference<CR>
vnoremap gN :vsc goToPreviousReference<CR>
nnoremap gL :vsc workbench.action.navigateToLastEditLocation<CR>

" Built-in undo/redo
nnoremap u :vsc undo<CR>
nnoremap U :vsc redo<CR>

" Use Built-in Search
"  nnoremap / :vsc actions.find<CR> 
"  nnoremap / :vsc actions.find<CR> 

" ------------------- MOVED TO WHICH KEY -------------------

" Vim Search
"  nnoremap <leader>/ /  " / (Vim Search)

" Buffer
"  nnoremap <leader>bh <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>" bh (Buffer -> Move Buffer to Left Group)
"  nnoremap <leader>bl <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>" bl (Buffer -> Move buffer to Right Group)
"  nnoremap <leader>bj <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>" bj (Buffer -> Move Buffer to Below Group)
"  nnoremap <leader>bk <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>" bk (Buffer -> Move buffer To Above Group)
"  nnoremap <leader>bn <Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR>"bn (Buffer -> New Buffer)
"  nnoremap <leader>bt <Cmd>call VSCodeNotify('workbench.action.pinEditor')<CR>"bt (Buffer -> Tab Pin)
"  nnoremap <leader>bT <Cmd>call VSCodeNotify('workbench.action.unpinwditor')<CR>"bT (Buffer -> Tab Unpin)
"  nnoremap <leader>by ggVGy"by (Buffer -> Yank Whole Buffer)
"  nnoremap <leader>bp ggVGp"bp (Buffer -> Paste Whole Buffer)
"  """" Buffer -> New
"  nnoremap <leader>bNh <Cmd>call VSCodeNotify('workbench.action.splitEditorLeft')<CR><Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR><Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>"bNh (Buffer -> New -> New Buffer Left)
"  nnoremap <leader>bNl <Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR><Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR><Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>"bNh (Buffer -> New -> New Buffer Right)
"  nnoremap <leader>bNj <Cmd>call VSCodeNotify('workbench.action.splitEditorAbove')<CR><Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR><Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>"bNh (Buffer -> New -> New Buffer Down)
"  nnoremap <leader>bNk <Cmd>call VSCodeNotify('workbench.action.splitEditorUp')<CR><Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR><Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>"bNh (Buffer -> New -> New Buffer Up)

"  " Debug
"  nnoremap <leader>dC <Cmd>call VSCodeNotify('editor.debug.action.runToCursor')<CR>" dC (Debug -> Run to Cursor)
"  nnoremap <leader>dc <Cmd>call VSCodeNotify('workbench.action.debug.continue')<CR>" dc (Debug -> Continue)
"  nnoremap <leader>di <Cmd>call VSCodeNotify('workbench.action.debug.stepInto')<CR>" di (Debug -> Step INTO)
"  nnoremap <leader>dj <Cmd>call VSCodeNotify('debug.jumpToCursor')<CR>" dj (Debug -> Jump to Cursor)
"  nnoremap <leader>dO <Cmd>call VSCodeNotify('workbench.action.debug.stepOut')<CR>" dO (Debug -> Step OUT)
"  nnoremap <leader>do <Cmd>call VSCodeNotify('workbench.action.debug.stepOver')<CR>" do (Debug -> Step OVER)
"  nnoremap <leader>dp <Cmd>call VSCodeNotify('workbench.action.debug.pause')<CR>" dp (Debug -> Pause)
"  nnoremap <leader>dR <Cmd>call VSCodeNotify('workbench.action.debug.restart')<CR>" dR (Debug -> Restart)
"  nnoremap <leader>dr <Cmd>call VSCodeNotify('workbench.action.debug.run')<CR>" dr (Debug -> Run without Debugging)
"  nnoremap <leader>ds <Cmd>call VSCodeNotify('workbench.action.debug.start')<CR>" ds (Debug -> Start)
"  nnoremap <leader>dS <Cmd>call VSCodeNotify('workbench.action.debug.stop')<CR>" dS (Debug -> Stop)
"  nnoremap <leader>dv <Cmd>call VSCodeNotify('workbench.debug.action.toggleRepl')<CR>" dv (Debug -> View Repl)
"  nnoremap <leader>dw <Cmd>call VSCodeNotify('workbench.debug.action.focusWatchView')<CR>" dw (Debug -> View Watch)
"  """" Debug ->  BreakPoints 
"  nnoremap <leader>dbb <Cmd>call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>" dbb (Debug -> Breakpoints -> Add Breakpoint)
"  nnoremap <leader>dbc <Cmd>call VSCodeNotify('editor.debug.action.conditionalBreakpoint')<CR>" dbb (Debug -> Breakpoints -> Add Conditional Breakpoint)
"  nnoremap <leader>dbd <Cmd>call VSCodeNotify('debug.removeBreakpoint')<CR>" dbd (Debug -> Breakpoint -> Remove Breakpoint)
"  nnoremap <leader>dbD <Cmd>call VSCodeNotify('workbench.debug.viewlet.action.removeAllBreakpoints')<CR>" dbD (Debug -> Breakpoint -> Remove All Breakpoints)
"  nnoremap <leader>dbE <Cmd>call VSCodeNotify('workbench.debug.viewlet.action.disableAllBreakpoints')<CR>"dbE (Debug -> Breakpoint -> Disable All Breakpoints)
"  nnoremap <leader>dbe <Cmd>call VSCodeNotify('workbench.debug.viewlet.action.enableAllBreakpoints')<CR>"dbe (Debug -> Breakpoint -> Enable All Breakpoints)
"  nnoremap <leader>dbn <Cmd>call VSCodeNotify('editor.debug.action.goToNextBreakpoint')<CR>" dbd (Debug -> Breakpoint -> Next Breakpoint)
"  nnoremap <leader>dbp <Cmd>call VSCodeNotify('editor.debug.action.goToPreviousBreakpoint')<CR>" dbd (Debug -> Breakpoint -> Previous Breakpoint)
"  nnoremap <leader>dbs <Cmd>call VSCodeNotify('debug.enableOrDisableBreakpoint')<CR>" dbd (Debug -> Breakpoint -> Enable/Disable (Switch) Breakpoint)

"  " Files
"  nnoremap <leader>fs <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>" fs (File -> Save)
"  nnoremap <leader>fS <Cmd>call VSCodeNotify('workbench.action.files.saveFiles')<CR>"fS (File -> SaveAll)
"  nnoremap <leader>fL <Cmd>call VSCodeNotify('revealFileInOS')<CR>" fL (File -> Locate in OS)
"  nnoremap <leader>fe <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>" fe (File -> View File in Explorer)
"  nnoremap <leader>fn <Cmd>call VSCodeNotify('explorer.newFile')<CR>" fn (File -> New File in Explorer)
"  """" Files -> Favorites
"  nnoremap <leader>ffa <Cmd> call VSCodeNotify('favorites.add')<CR>" ffa (File -> Favorites -> Add)
"  nnoremap <leader>ffd <Cmd> call VSCodeNotify('favorites.del')<CR>" ffd (File -> Favorites -> Delete)
"  nnoremap <leader>ffl <Cmd> call VSCodeNotify('favorites.open')<CR>"ffl (File -> Favorites -> List)

"  " Git
"  nnoremap <leader>gm <Cmd>call VSCodeNotify('magit.status')<CR>" gm (Git -> Magit)
"  """" Git -> Git Lens
"  nnoremap <leader>glb <Cmd>call VSCodeNotify('gitlens.toggleFileBlame')<CR>" glb (Git -> Lens -> Toggle Blame)
"  nnoremap <leader>glc <Cmd>call VSCodeNotify('gitlens.compareWorkingWith')<CR>" glc (Git -> Lens -> Compare With)
"  nnoremap <leader>gld <Cmd>call VSCodeNotify('gitlens.diffWithPrevious')<CR>" gld (Git -> Lens -> Diff)
"  nnoremap <leader>gls <Cmd>call VSCodeNotify('gitlens.views.switchToAnotherBranch')<CR>" glsb (Git -> Lens -> Switch Branch)
"  nnoremap <leader>glw <Cmd>call VSCodeNotify('gitlens.gitCommands.worktree')<CR>" glw (Git -> Lens -> WorkTree)

"  " LSP
"  nnoremap <leader>la <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>" la (LSP -> Action)
"  nnoremap <leader>lh <Cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<CR>" lh (LSP -> Hover)
"  nnoremap <leader>lm <Cmd>call VSCodeNotify('editor.action.triggerParameterHints')<CR>" lm ( LSP -> Method Hint)
"  nnoremap <leader>lr <Cmd>call VSCodeNotify('editor.action.rename')<cr>" lr ( LSP -> Rename)
"  """" LSP -> Error
"  nnoremap <leader>leN <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>" leN (LSP -> Error -> Next All Files)
"  nnoremap <leader>len <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>" len (LSP -> Error -> Next in File)
"  nnoremap <leader>leP <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>" leP (LSP -> Error -> Previous All Files)
"  nnoremap <leader>lep <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>" lep (LSP -> Error -> Previous in File)
"  nnoremap <leader>lev <Cmd>call VSCodeNotify('workbench.panel.markers.view.focus')<CR>" lev ( LSP -> Error -> View)

"  " Leetcode
"  nnoremap <leader>Lh <Cmd>call VSCodeNotify('leetcode.showSolution')<CR>" Lh (Leetcode -> Help)
"  nnoremap <leader>Lp <Cmd>call VSCodeNotify('leetcode.showProblem')<CR>" Lp (Leetcode -> Problem)
"  nnoremap <leader>Ls <Cmd>call VSCodeNotify('leetcode.searchProblem')<CR>" Ls (Leetcode -> Search Problem)
"  nnoremap <leader>Lt <Cmd>call VSCodeNotify('leetcode.testSolution')<CR>" Lt (Leetcode -> Test)
"  nnoremap <leader>Lv <Cmd>call VSCodeNotify('leetCodeExplorer.focus')<CR>" Lv (Leetcode -> View)

"  " Major
"  """" Major -> FSharp
"  nnoremap <leader>Mff <Cmd>call VSCodeNotify('fsi.SendFile')<CR>" Mff (Major -> FSharp -> Send File)
"  nnoremap <leader>Mfl <Cmd>call VSCodeNotify('fsi.SendLine')<CR>" Mfl ( Major -> FSharp -> Send)
"  nnoremap <leader>Mfs <Cmd>call VSCodeNotify('fsi.SendSelection')<CR>" Mfs (Major -> FSharp -> Send Selection)
"  vnoremap <leader>Mff <Cmd>call VSCodeNotify('fsi.SendFile')<CR>" Mff (Major -> FSharp -> Send File)
"  vnoremap <leader>Mfl <Cmd>call VSCodeNotify('fsi.SendLine')<CR>" Mfl ( Major -> FSharp -> Send)
"  vnoremap <leader>Mfs <Cmd>call VSCodeNotify('fsi.SendSelection')<CR>" Mfs (Major -> FSharp -> Send Selection)

"  " Marks - Using Bookmarks extensions besides the native vim marks
"  nnoremap <leader>mc <Cmd>call VSCodeNotify('bookmarks.clear')<CR>" mc ( Mark -> Clear)
"  nnoremap <leader>mC <Cmd>call VSCodeNotify('bookmarks.clearFromAllFiles')<CR>" mC ( Mark -> Clear All)
"  nnoremap <leader>mf <Cmd>call VSCodeNotify('bookmarks.list')<CR>" mf ( Mark -> Find)
"  nnoremap <leader>mF <Cmd>call VSCodeNotify('bookmarks.listFromAllFiles')<CR>" mF ( Mark -> Find All Files)
"  nnoremap <leader>ml <Cmd>call VSCodeNotify('bookmarks.toggleLabeled')<CR>" ml (Mark -> Labeled)
"  nnoremap <leader>mn <Cmd>call VSCodeNotify('bookmarks.jumpToNext')<CR>" mn ( Mark -> Next )
"  nnoremap <leader>mp <Cmd>call VSCodeNotify('bookmarks.jumpToPrevious')<CR>" mp ( Mark -> Previous )
"  nnoremap <leader>mt <Cmd>call VSCodeNotify('bookmarks.toggle')<CR>" mt (Mark -> Toggle)
"  nnoremap <leader>mv <Cmd>call VSCodeNotify('bookmarksExplorer.focus')<CR>" mv ( Mark -> View Explorer)

"  " Project
"  nnoremap <leader>pb <Cmd>call VSCodeNotify('workbench.action.tasks.build')<CR>" pb ( Project -> Build )
"  """" Project -> Test
"  nnoremap <leader>ptw <Cmd>call VSCodeNotify('workbench.action.tasks.test')<CR>" pt ( Project -> Test -> Whole Project )
"  """" Project -> Workspace
"  nnoremap <leader>pwa <Cmd>call VSCodeNotify('workbench.action.addRootFolder')<CR>" pwa ( Project -> Workspace -> Add)
"  nnoremap <leader>pwc <Cmd>call VSCodeNotify('workbench.action.files.openFolderViaWorkspace')<CR>" pwc ( Project -> Workspace -> Change)
"  nnoremap <leader>pwq <Cmd>call VSCodeNotify('workbench.action.closeFolder')<CR>" pwq (Project -> Workspace -> Quit)
"  nnoremap <leader>pwr <Cmd>call VSCodeNotify('workbench.action.removeRootFolder')<CR>" pwd (Project -> Workspace -> Remove)

"  " Quit
"  nnoremap <leader>qq <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>" qq -> (Quit -> Quit File)
"  nnoremap <leader>qk <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>" qk -> (Quit -> Keep Current File)
"  nnoremap <leader>Q <Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>" qQ -> (Quit -> Quit All)
"  nnoremap <leader>qu <Cmd>call VSCodeNotify('workbench.action.reopenClosedEditor')<CR>" qu -> (Quit -> Undo (Re-open File))

"  " Search
"  nnoremap <leader>sc <Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'cmd-openFileContent')<CR>" sc (Search -> File Content)
"  nnoremap <leader>sC <Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'cmd-openFileContentWorkspaces')<CR>" sC (Search -> File Content (Configured Workspaces))
"  nnoremap <leader>se <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>" se (Search -> Everything)
"  nnoremap <leader>sf <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>" sf (Search -> File)
"  nnoremap <leader>sn <Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'cmd-searchFileName')<CR>" sn (Search -> File Name)
"  nnoremap <leader>sN <Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'cmd-searchFileNameWorkspaces')<CR>" sN (Search -> File Name (Configured Workspaces))
"  nnoremap <leader>sr <Cmd>call VSCodeNotify('workbench.action.openRecent')<CR>" sr (Search -> Recent Files)
"  nnoremap <leader>ss <Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>" ss (Search -> Symbol)
"  nnoremap <leader>sS <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>" sS (Search -> Symbol Whole Project)
"  """" Search -> Project Manager
"  nnoremap <leader>sma <Cmd>call VSCodeNotify('projectManager.addToWorkspace')<CR>" sma (Search -> Project Manager -> Add to Favorites)
"  nnoremap <leader>smf <Cmd>call VSCodeNotify('projectManager.filterProjectsByTag')<CR>" smf (Search -> Project Manager -> Filter Projects)
"  nnoremap <leader>sml <Cmd>call VSCodeNotify('projectManager.listProjects')<CR>" sml (Search -> Project Manager -> List)
"  nnoremap <leader>smr <Cmd>call VSCodeNotify('projectManager.refreshAnyProjects')<CR>" smr (Search -> Project Manager -> Refresh Projects)

"  " Text
"  nnoremap <leader>ti <Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>" ti (Text -> Organize Imports)
"  nnoremap <leader>tR <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>" tR (Text -> Find References)
"  nnoremap <leader>tr <Cmd>call VSCodeNotify('workbench.action.replaceInFiles ')<CR>" tr -> (Text -> Replace)

"  " View
"  nnoremap <leader>vE <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>"vE (View -> Errors List)
"  nnoremap <leader>ve <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>" ve (View -> Explorer)
"  nnoremap <leader>vL <Cmd>call VSCodeNotify('leetCodeExplorer.focus')<CR>" vL (View -> Leetcode)
"  nnoremap <leader>vm <Cmd>call VSCodeNotify('bookmarksExplorer.focus')<CR>" vm (View -> Marks)
"  nnoremap <leader>vp <Cmd>call VSCodeNotify('projectsExplorerGit.focus')<CR>" vp (View -> Project Manager)
"  """" View -> Debug
"  nnoremap <leader>vdr <Cmd>call VSCodeNotify('workbench.debug.action.toggleRepl')<CR>" vdr (View -> Debug -> Repl)
"  nnoremap <leader>vdw <Cmd>call VSCodeNotify('workbench.debug.action.focusWatchView')<CR>" vdw (View -> Debug -> Watch)
"  """" View -> LSP
"  nnoremap <leader>vle <Cmd>call VSCodeNotify('workbench.panel.markers.view.focus')<CR>" vle ( View -> LSP -> Errors)
"  """" View -> Toggle
"  nnoremap <leader>vta <Cmd>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<CR>"vta (View -> Toggle -> AcitivityBar)
"  nnoremap <leader>vte <Cmd>call VSCodeNotify('errorLens.toggle')<CR>"vtel (View -> Toggle -> error lens)
"  nnoremap <leader>vts <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>"vts (View -> Toggle -> SideBar)
"  nnoremap <leader>vtz <Cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>"vtz (View -> Toggle -> ZenMode)

"  " Commands
"  nnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
"  vnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>

"  " Jump
"  nnoremap <leader>j <Plug>(easymotion-s) " j (Jump)
"  vnoremap <leader>j <Plug>(easymotion-s) " j (Jump)