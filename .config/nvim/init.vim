
" PLUGINS
"
call plug#begin('~/.vim/plugged')
" Theme
"Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
" Files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs',
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
call plug#end()
"
"
"
"
" SETUP THEME
"
set termguicolors     " enable true colors support
"let ayucolor="dark"   " for dark version of theme
colorscheme onedark
"
"
"

"
" SETTINGS "
"
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
"
"
"
"  Git Gutter Settings  "
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
"
"
"
" REMAP KEYS "
"
let mapleader = " "
" reload config
nnoremap <leader>r<CR> :so ~/.config/nvim/init.vim<CR>
" Vertical explorer split
nnoremap <leader>pv :Vex<CR>
" Fzy finder git files
nnoremap <C-p> :GFiles<CR>
" Fzy finder files
nnoremap <leader>pf :Files<CR>
" grep with quickfix list
nnoremap <C-E> :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
" yank to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
" move line up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
"
"
