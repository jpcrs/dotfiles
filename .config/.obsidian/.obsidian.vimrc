
" ------------------- Default Configuration -------------------
set clipboard=unnamedplus

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

" Tab navigation
nnoremap tl gt
nnoremap th gT
nnoremap <C-h> gT
nnoremap <C-l> gt


" ------------------- Obsidian commands rebind -------------------
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

unmap <Space>
exmap followlink obcommand editor:follow-link
map gd :followlink

exmap savefile obcommand editor:save-file
map <Space>fs :savefile

exmap omnisearchall obcommand omnisearch:show-modal
map <Space>sc :omnisearchall

exmap searcheverything obcommand command-palette:open
map <Space>se :searcheverything

exmap quickswitch obcommand switcher:open
map <Space>sf :quickswitch

exmap quickadd obcommand quickadd:runQuickAdd
map <Space>n :quickadd

exmap closebuffer obcommand workspace:close
map <Space>qq :closebuffer

exmap closeothers obcommand workspace:close-others
map <Space>qk :closeothers

exmap togglezen obcommand zen:toggle
map <Space>vtz :togglezen

exmap togglecalendar obcommand calendar:show-calendar-view
map <Space>vtc :togglecalendar

exmap nexttab obcommand workspace:next-tab
map tl :nexttab

exmap previoustab obcommand workspace:previous-tab
map th :previoustab

exmap splitvertical obcommand workspace:split-vertical
map <Space>bl :splitvertical

exmap splithorizontal obcommand workspace:split-horizontal
map <Space>bj :splithorizontal

exmap renameheading obcommand editor:rename-heading
map <Space>r :renameheading

exmap focustop obcommand editor:focus-top
map <C-w>k :focustop

exmap focusbottom obcommand editor:focus-bottom
map <C-w>j :focusbottom

exmap focusleft obcommand editor:focus-left
map <C-w>h :focusleft

exmap focusright obcommand editor:focus-right
map <C-w>l :focusright
