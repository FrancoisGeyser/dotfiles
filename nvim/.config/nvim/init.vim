"
" PLUGINS
"
call plug#begin('~/.vim/plugged')
" Theme
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" git - fugitive
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"
" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" Code tools
Plug 'jiangmiao/auto-pairs' "Auto bracket pairs
Plug 'tomtom/tcomment_vim' "Toggle comments
Plug 'mattn/emmet-vim' "Emmet -- Breaks :E command
Plug 'tpope/vim-surround' "Surround
"
" JS
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
"
" Styling
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"
"Cheat sheet
Plug 'dbeniamine/cheat.sh-vim'
call plug#end()
"
"
let g:coc_global_extensions = [
            \ 'coc-emmet',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-css',
            \ 'coc-cssmodules',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier'
            \ ]
"
"
" SETUP THEME
"
set termguicolors     " enable true colors support
colorscheme onedark
"
"
"
" SETTINGS 
"
set scrolloff=10
set number
set relativenumber
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set incsearch "vim searches text as you enter it
" set hlsearch "hilights searched items
set ignorecase "case insensitive search
set smartcase "case sensetive when using captials
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
set showmatch "shows matching parents, brackets"
"
"  Git Gutter Settings  "
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '???'
let g:gitgutter_sign_modified = '???'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
"
"
" Commands
command! E Explore " Fix for broken :E command
"
"
" REMAP KEYS "
"
inoremap jk <ESC>
" Emmet key
let g:user_emmet_leader_key='<C-e>'
" Leader key
let mapleader = " "
" reload config
nnoremap <leader>r<CR> :so ~/.config/nvim/init.vim<CR>
" Create new buffers vertically or horizontally 
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s
"
" Toggle between the buffers
nnoremap ,, <C-w>w
"
" Increase or decrease buffer size
noremap <C-Up> <C-W>+
noremap <C-Down> <C-W>-
noremap <C-Left> <C-W>>
noremap <C-Right> <C-W><
" Explorer
nnoremap <leader>pe :E<CR>
" Horizontal explorer split
nnoremap <leader>ph :Hex<CR>
"Vertical explorer split
nnoremap <leader>pv :Vex<CR>
" Fzy finder git files
nnoremap <C-p> :GFiles<CR>
" Fzy finder files
nnoremap <C-f> :Files<CR>
nnoremap <silent> <C-R> :Rg<CR>
" grep with quickfix list
nnoremap <C-E> :copen<CR>
nnoremap <C-J> :cnext<CR>
nnoremap <C-K> :cprev<CR>
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
"
nnoremap <leader>d "_d
vnoremap <leader>d "_d
"
" Surround
nmap <expr> <silent> <leader>sw "ysiw" . input("Surround word with : ")
nmap <expr> <silent> <leader>s "yss" . input("Surround with : ")
vmap <expr> <silent> <leader>s "S" . input("Surround with: ")
" Todo add shortcuts for changing
"
" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
nmap <leader>F :CocCommand prettier.formatFile<CR>
"
"
" Coc
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
