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
  Plug 'justinmk/vim-sneak'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'

  " theme
  Plug 'ajmwagar/vim-deus'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'fenetikm/falcon'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'mcchrish/zenbones.nvim'
  Plug 'sainnhe/edge'
  Plug 'sainnhe/everforest'
  Plug 'sainnhe/gruvbox-material'
  Plug 'sainnhe/sonokai'
  Plug 'sjl/badwolf'
  Plug 'phanviet/vim-monokai-pro'

  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'

  " syntax highlighting / snippets / formatting
  Plug 'HerringtonDarkholme/yats.vim' " typescript highlighting
  Plug 'mattn/emmet-vim' " emmet
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'preservim/nerdcommenter' " comment shortcuts
  Plug 'sheerun/vim-polyglot'
  Plug 'yggdroot/indentline' " indent line

  " git
  Plug 'airblade/vim-gitgutter' " git status in gutter
  Plug 'APZelos/blamer.nvim'

  " nerdtree
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " file tree
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" -------- 
" SETTINGS
" -------- 

" VIM

set cursorline
set encoding=UTF-8
set expandtab
set guifont=Fira\ Code\ iCursive\ Op:h11
set ignorecase
set nopaste
set number
set scrolloff=999
set showtabline=2 " Show tab line when there is only one file open
set smartcase
set softtabstop=2
set splitbelow
set splitright

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

" open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" open NERDTree by default
" autocmd VimEnter * NERDTree

" NERDTREE GIT

let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusIndicatorMapCustom = {
                " \ 'Modified'  :'✹',
                " \ 'Staged'    :'✚',
                " \ 'Untracked' :'✭',
                " \ 'Renamed'   :'➜',
                " \ 'Unmerged'  :'═',
                " \ 'Deleted'   :'✖',
                " \ 'Dirty'     :'✗',
                " \ 'Ignored'   :'☒',
                " \ 'Clean'     :'✔︎',
                " \ 'Unknown'   :'?',
                " \ }


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
  \ 'coc-emmet',
  \ 'coc-go',
  \ 'coc-inline-jest',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-phpls',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-yank',
  \ ]

" highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" format file
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" INDENTLINE

let g:indentLine_char = '.'
" let g:indentLine_first_char = '|'
" let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1

" POLYGLOT

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" NEOVIDE

" let g:neovide_fullscreen=v:true

" ===========
" KEYBINDINGS
" ===========

" VIM

" use H to navigate to start of text
nnoremap H ^
" use L to navigate to end of line
nnoremap L g_
" create new tab
nnoremap <C-t> :tabnew<CR>
" go to next tab
nnoremap t :tabnext<CR>
" go to previous tab
nnoremap T :tabprev<CR>
" go to tab to the left
nnoremap <silent> <A-Left> :tabm -1<CR>
" go to tab to the right
nnoremap <silent> <A-Right> :tabm +1<CR>
" clear last search highlight
nnoremap <C-l> :noh<CR>
" go to next instance of two characters
map <leader>f <Plug>Sneak_s
" go to previous instance of two characters
map <leader>F <Plug>Sneak_S
" Spacing for new code block
inoremap <C-Return> <CR><CR><C-o>k<Tab>
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" COC

" apply codeAction to the current line
nmap <leader>ac  <Plug>(coc-codeaction)
" quick fix the current line
nmap <leader>qf  <Plug>(coc-fix-current)
" open diagnostic window
nnoremap <C-d> :CocDiagnostics<CR> 

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" rename current word
nmap <F2> <Plug>(coc-rename)

" use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call cocactionasync('dohover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" NERDCOMMENTER

" toggle NerdCommenter
map <C-_> <plug>NERDCommenterToggle

" FZF FUZZYFINDER

" find file
nnoremap <C-p> :FZF<CR>
" find string in all files
nnoremap <C-F> :Ag<CR>
" find tags
nnoremap <C-i> :BTags<CR>
" view git status
nnoremap <C-g> :GFiles?<CR>
" view git history of buffer
nnoremap <leader>gh :BCommits<CR>
" view buffers
nnoremap <C-b> :Buffers<CR>

" PRETTIER

vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

" NERDTREE KEYMAPS

" open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" find file in NERDTree
nmap <leader>nf :NERDTreeFind<CR>
" mirror files in NERDTree
nmap <leader>nm :NERDTreeMirror<CR>

" ----- 
" THEME
" -----

if (has('termguicolors'))
  set termguicolors
endif

set background=dark

let g:everforest_background='hard'

" default, palenight, ocean, lighter, darker, default-community, palenight-community, ocean-community, lighter-community, darker-community
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1

" mirage, dark, light
let ayucolor="mirage"

" default, atlantis, andromeda, shusia, maia, espresso
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1


" dark, aura, neon, light
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 1

" hard, medium(default), soft
let g:gruvbox_material_background = 'soft'
" material, mix, original
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
" let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1

" material, grubox-material
let g:airline_theme = 'gruvbox_material'

" lightline
" let g:lightline = {'colorscheme' : 'gruvbox_material'}
let g:lightline = {'colorscheme' : 'monokai_pro'}

" colorscheme gruvbox-material
colorscheme monokai_pro_machine
