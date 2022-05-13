"
" PLUGINS
"
call plug#begin('~/.vim/plugged')
" Theme
"Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
" Files
" Plug 'jremmen/vim-ripgrep'
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
"Toggle comments
Plug 'tomtom/tcomment_vim'
"Cheat sheet
Plug 'dbeniamine/cheat.sh-vim'
call plug#end()
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
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
set path+=**
" Ignore files
set wildignore+=**/build/*
set wildignore+=**/dist/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
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
" REMAP KEYS "
"
inoremap jk <ESC>
let mapleader = " "
" reload config
nnoremap <leader>r<CR> :so ~/.config/nvim/init.vim<CR>
" Explorer
nnoremap <leader>pe :E<CR>
" Horizontal explorer split
nnoremap <leader>ph :Hex<CR>
"Vertical explorer split
nnoremap <leader>pv :Vex<CR>
" Fzy finder git files
nnoremap <C-p> :GFiles<CR>
" Fzy finder files
nnoremap <leader>pf :Files<CR>
nnoremap <silent> <Leader>ff :Rg<CR>
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
" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d
"
"
"
" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>f :CocCommand prettier.formatFile<CR>
"
