" Don't try to be vi compatible
set nocompatible

" Enable mouse support
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

" BEGIN: plugins
call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'
" Color themes
Plug 'habamax/vim-gruvbit'
" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" LaTeX
Plug 'lervag/vimtex'
" Git
Plug 'tpope/vim-fugitive'
" Floating terminal
Plug 'voldikss/vim-floaterm'
" Diagnostics
Plug 'folke/trouble.nvim'
" Zen mode
Plug 'folke/zen-mode.nvim'
" auto-pairs
Plug 'windwp/nvim-autopairs'
" Snippets
Plug 'hrsh7th/vim-vsnip'
" Icons
Plug 'kyazdani42/nvim-web-devicons'
" Statusline
Plug 'nvim-lualine/lualine.nvim'
" Bufferline
Plug 'akinsho/bufferline.nvim'
" File tree
Plug 'kyazdani42/nvim-tree.lua'
" Colorize lsp
Plug 'folke/lsp-colors.nvim'
call plug#end()
" END: plugins

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" ~/.vim/colors 

set termguicolors
colorscheme gruvbit

" This is so the pop up shows up faster
set updatetime=500

" BEGIN: Lua
lua << EOF
require("autocomplete")
require("treesitter")
require("lsp")
require('nvim-autopairs').setup()
require'nvim-tree'.setup()
require('bufferline').setup { 
    options = {
        diagnostics = "nvim_diagnostic", 
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
        show_buffer_icons = false,
    }
}

local colors = {
  yellow   = '#ECBE7B',
  green    = '#98be65',
  red      = '#ec5f67',
  darkblue = '#081633',
}

require('lualine').setup {
  options = {
    theme = 'horizon',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'branch', separator = { left = '', right = '' } },
    },
    lualine_b = { 
        {
        'diff',
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
        },
        'filename'},
    lualine_c = {
        {
        'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
              color_error = { fg = colors.red },
              color_warn = { fg = colors.yellow },
              color_info = { fg = colors.darkblue },
            },
        }
    },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
}
EOF
" END: Lua

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

" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" clear search
map <silent> <leader><space> :noh<CR>

" save
nmap <silent> <leader>w :up<CR>

" == Telescope ==
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-l> <cmd>Telescope buffers<cr>

" == Trouble ==
nnoremap <leader>t <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>qf <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>ll <cmd>TroubleToggle loclist<cr>
nnoremap gr <cmd>TroubleToggle lsp_references<cr>

" == Open URL in browser ==
nmap <silent> gx :!open <cWORD><cr>

" == Change buffer ==
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><Tab> :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>

" == File tree ==
nnoremap <C-b> :NvimTreeToggle<CR>
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

set colorcolumn=80
highlight ColorColumn ctermbg=7

set clipboard=unnamedplus

" BEGIN: floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_borderchars = '─│─│╭╮╯╰'
hi FloatermBorder guifg=orange
" END: floaterm
