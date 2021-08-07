set nocompatible

let s:using_snippets=1

let mapleader="\<Space>"
call plug#begin('~/.vim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'puremourning/vimspector'
Plug 'dense-analysis/ale'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'orangeT/vim-csharp'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/Yats.vim'
Plug 'maxMEllon/vim-jsx-pretty'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
if s:using_snippets
  Plug 'sirver/ultisnips'
endif
call plug#end()

set termguicolors
set t_Co=16
set background=dark
colorscheme palenight
syntax on

inoremap jk <Esc>

set tabstop=4
set softtabstop=4
set shiftwidth=4

set relativenumber
set nu rnu
set ruler
set showcmd
set noswapfile
set noshowmode
set cursorline

set autoindent
set smartindent

set wildmenu
set lazyredraw
set showmatch

let g:notes_directories = ['~/Documents/Notes']

" WINDOW HOPPING
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" MOVEMENT
map <leader>K <C-u><CR>
map <leader>J <C-d><CR>

" BUFFERS
map <leader>b :bp<CR>
map <leader>n :bn<CR>
map <leader>d :bd<CR>

" CTRLP
"map <leader>p :CtrlP<CR>

" TERMINAL
map <leader>t :split +te<CR>
set splitbelow

" OMNISHARP
" Show type information automatically when the cursor stops moving.
" Note that the type is echoed to the Vim command line, and will overwrite
" any other messages in this space including e.g. ALE linting messages.
autocmd CursorHold *.cs OmniSharpTypeLookup

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_right_sep = ""
let g:airline_left_sep = ""

" ALE
let g:ale_completion_autoimport = 1

" NERDTREE
nnoremap <leader>v :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinSize=40

" CTRLP
map <leader>p :CtrlP<CR>

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" DEBUGGER
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :call vimspector#Reset()<CR>
nmap <leader>dc :call vimspector#Continue()<CR>
nmap <leader>tb <Plug>VimspectorToggleBreakpoint
nmap <leader>si <Plug>VimspectorStepInto
nmap <leader>so <Plug>VimspectorStepOver
nmap <leader>su <Plug>VimspectorStepOut
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval