" --------
" PLUGINS
" --------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " actions / utilities
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-sensible' " sensible standards
  Plug 'christoomey/vim-tmux-navigator'

  " theme
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " syntax highlighting / snippets / formatting
  Plug 'tpope/vim-sleuth'
  Plug 'yggdroot/indentline' " indent line
  Plug 'sheerun/vim-polyglot'
  Plug 'HerringtonDarkholme/yats.vim' " typescript highlighting
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'mattn/emmet-vim' " emmet
  Plug 'preservim/nerdcommenter' " comment shortcuts

  " git
  Plug 'APZelos/blamer.nvim'
  Plug 'airblade/vim-gitgutter' " git status in gutter

  " nerdtree
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " file tree
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" ----- 
" THEME
" -----

set termguicolors
colorscheme gruvbox

" -------- 
" SETTINGS
" -------- 

" VIM

set cursorline
set expandtab
" set guifont=FiraCode\ Nerd\ Font\ Mono:h12
set ignorecase
set nopaste
set number
set shiftwidth=2
set showtabline=2 " Show tab line when there is only one file open
set smartcase
set softtabstop=2

let pyxversion=3
let mapleader = ","

" cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=3\x7"

" NERDTREE

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" GIT BLAMER

let g:blamer_enabled = 1
let g:blamer_date_format = '%Y-%m-%d %H:%M'
let g:blamer_relative_time = 1

" NERDCOMMENTER

let g:NERDCreateDefaultMappings = 1
let g:NERDDEfaultAligh = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

" COC

let g:coc_global_extensions = [
  \ 'coc-go',
  \ 'coc-inline-jest',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tsserver'
  \ ]

" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" format file
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" INDENTLINE

let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" ===========
" KEYBINDINGS
" ===========

" VIM

nnoremap H ^
nnoremap L g_
nnoremap <C-t> :tabnew<CR>
nnoremap t :tabnext<CR>
nnoremap T :tabprev<CR>
" Spacing for new code block
inoremap <C-Return> <CR><CR><C-o>k<Tab>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" COC

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" NERDCOMMENTER

map <C-_> <plug>NERDCommenterToggle

" FZF FUZZYFINDER

nnoremap <C-p> :FZF<CR>
nnoremap <C-F> :Ag<CR>

" TABS

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>

" PRETTIER

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" NERDTREE KEYMAPS

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <F2> :Move<CR>

