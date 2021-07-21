" Don't try to be vi compatible
set nocompatible

" Enable mouse support
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

" BEGIN: plugins
call plug#begin()
" Color themes
Plug 'sainnhe/gruvbox-material'
Plug 'Th3Whit3Wolf/one-nvim'
" LSP
Plug 'neovim/nvim-lspconfig'
" Autocomplete
Plug 'hrsh7th/nvim-compe'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Multi language support
Plug 'sheerun/vim-polyglot'
" LaTeX
Plug 'lervag/vimtex'
" Git
Plug 'tpope/vim-fugitive'
" Display buffers as tabs
Plug 'ap/vim-buftabline'
" Floating terminal
Plug 'voldikss/vim-floaterm'
" Diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" Zen mode
Plug 'folke/zen-mode.nvim'
call plug#end()
" END: plugins

" BEGIN: imports
lua require("autocomplete")
lua require("treesitter")
lua require("lsp")
" END: imports

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

set autoindent

let mapleader = " "

set number relativenumber 

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8

set foldmethod=syntax
" don't fold when opening a file
set foldlevel=99

" Whitespace
set nowrap
set linebreak
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4 shiftwidth=4 expandtab

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" BEGIN: remaps
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Insert new line and stay in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
"
" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace selected text yanking it
vnoremap <leader>p "_dP

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
nmap <leader>f gg=G''

" save
nmap <silent> <leader>w :up<CR>

" == Telescope ==
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-l> <cmd>Telescope buffers<cr>

" == Autocomplete ==
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gr <cmd>TroubleToggle lsp_references<cr>

" END: remaps  

" Allow hidden buffers
set hidden
" Rendering
set ttyfast
" Status bar
set laststatus=2

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

set termguicolors

colorscheme one-nvim

set colorcolumn=80
highlight ColorColumn ctermbg=7

set clipboard=unnamedplus

" BEGIN: BufTabLine keybindings  

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

" END: BufTabLine keybindings  


" BEGIN: Statusline
function! GitBranch()
    let l:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    let b:gitbranch = strlen(l:branch) > 0 ? '  '.l:branch.' ' : ''
endfunction

augroup GetGitBranch
    autocmd!
    autocmd VimEnter,WinEnter,BufEnter * call GitBranch()
augroup END

set statusline=
set statusline+=%#PmenuSel#         " change background color to light
set statusline+=%{b:gitbranch}      " git info
set statusline+=%#LineNr#           " change background color back to dark
set statusline+=\ %f                " file name
set statusline+=%=                  " display everithing on the right after this
set statusline+=%{&filetype}
set statusline+=\ \|                " separator
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|                " separator
set statusline+=\ %{&fileformat}
set statusline+=\ \|                " separator
set statusline+=\ %p%%              " scroll percentage
set statusline+=\ %l:%c             " line:column
" END: Statusline

" BEGIN: floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_borderchars = '─│─│╭╮╯╰'
hi FloatermBorder guifg=orange
" END: floaterm
