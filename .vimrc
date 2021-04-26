set relativenumber

" Enable mouse support
set mouse=a

syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4

let mapleader = " "

" Formatting
map <leader>q gqip
" Insert new line and stay in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
