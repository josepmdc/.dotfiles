" Don't try to be vi compatible
set nocompatible

" Enable mouse support
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (pathogen or vundle)
call plug#begin()

" Color themes
  Plug 'sainnhe/gruvbox-material'

" fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" Language support
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " SQL
  Plug 'vim-scripts/dbext.vim'
  " JS/TypeScript/React
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  " LaTeX
  Plug 'lervag/vimtex'

" Toolbar
  Plug 'itchyny/lightline.vim'

" Git
  Plug 'tpope/vim-fugitive'

" Display buffers as tabs
  Plug 'ap/vim-buftabline'

" Distraction free writing
  Plug 'junegunn/goyo.vim'

call plug#end()

" Turn on syntax highlighting
syntax on

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
" let g:go_auto_sameids = 1
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" For plugins to load correctly
filetype plugin indent on

let mapleader = " "

" Security
set modelines=0

" Show line numbers
set number relativenumber 

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set linebreak
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" =================
"   BEGIN: remaps  
" =================
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Insert new line and stay in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Shift up/down to scroll
map <S-Down> <C-E>
map <S-Up> <C-Y>

" Searching
nnoremap / /\v
vnoremap / /\v
" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Toogle netrw
map <silent> <C-B> :Lexplore<CR>

" CTRL-s to save
nmap <silent> <C-s> :w<CR>

" == FZF ==
" Open files search
nnoremap <C-p> :Files<CR>
" Search all files
nnoremap <C-f> :Rg<CR>
" FZF Buffers
nnoremap <C-l> :Buffers<CR>

" ===============
"   END: remaps  
" ===============

" Allow hidden buffers
set hidden
" Rendering
set ttyfast
" Status bar
set laststatus=2

set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Formatting
set smartindent

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" ~/.vim/colors 

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox-material 

set colorcolumn=80
highlight ColorColumn ctermbg=7

set clipboard=unnamedplus

" ================
"   BEGIN: NETRW  
" ================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" ==============
"   END: NETRW  
" ==============

" ===================
"   BEGIN: COC.NVIM  
" ===================
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-go', 
  \ 'coc-python', 
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-clangd',
  \ 'coc-vimtex',
  \ ]

" =================
"   END: COC.NVIM  
" =================

" ==============
"   BEGIN: FZF  
" ==============
let g:fzf_layout = { 'window': { 'width' : 0.6, 'height' : 0.6 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ============
"   END: FZF  
" ============

" ====================
"   BEGIN: lightline  
" ====================
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

" Show filename with path relative to (git) project root
function! LightlineFilename()
  return expand('%')
endfunction
" ==================
"   END: lightline  
" ==================

" =================================
"   BEGIN: BufTabLine keybindings  
" =================================

" Display ordinal numbering on tabs
let g:buftabline_numbers = 2
" Display an indicator if the file has been modified
let g:buftabline_indicators = 1

" Go to buffer by ordinal number
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" ===============================
"   END: BufTabLine keybindings  
" ===============================
