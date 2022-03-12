if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  if !exists('g:vscode')
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
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'sonph/onehalf', { 'rtp': 'vim' }

    " buffer and status lines
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    "Plug 'itchyny/lightline.vim'

    " file tree
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'liuchengxu/vista.vim'

    " syntax highlighting / snippets / formatting
    Plug 'HerringtonDarkholme/yats.vim' " typescript highlighting
    Plug 'mattn/emmet-vim' " emmet
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
    Plug 'preservim/nerdcommenter' " comment shortcuts
    Plug 'sheerun/vim-polyglot'
    Plug 'yggdroot/indentline' " indent line
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " git
    Plug 'airblade/vim-gitgutter' " git status in gutter
    Plug 'APZelos/blamer.nvim'
    Plug 'tpope/vim-fugitive'

    " debugger
    Plug 'vim-vdebug/vdebug'

    " documentation
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

    " actions/utilities
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion
    Plug 'github/copilot.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf.vim'
  endif

  " actions / utilities
  Plug 'bfredl/nvim-miniyank'
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'andymass/vim-matchup'
call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

if !exists('g:vscode')
  colorscheme material
endif

lua <<EOF
require('coc')
require('settings')
require('keymaps')
require('themes')
EOF

"let g:lightline = {
      "\ 'colorscheme': 'material',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'readonly', 'filename', 'modified', 'method' ] ]
      "\ },
      "\ 'component_function': {
      "\   'method': 'NearestMethodOrFunction'
      "\ },
      "\ }


" cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=3\x7"

if exists('g:vscode')
else
  " Spacing for new code block
  "inoremap <C-Return> <CR><CR><C-o>k<Tab>
  " toggle NerdCommenter
  map <C-_> <plug>NERDCommenterToggle
  if has('nvim')
    " use <c-space> to trigger completion
    inoremap <silent><expr> <c-space> coc#refresh()
    " rename current word
    "nmap <F2> <Plug>(coc-rename)
    " highlight the symbol and its references when holding the cursor.
    " autocmd CursorHold * silent call CocActionAsync('highlight')
    " format file
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif
endif

" MINIYANK
"map p <Plug>(miniyank-autoput)
"map P <Plug>(miniyank-autoPut)
"" directly put the most recent item in the shared history
"map <leader>p <Plug>(miniyank-startput)
"map <leader>P <Plug>(miniyank-startPut)
"" right after a put, use cycle to go through history
"map <leader>n <Plug>(miniyank-cycle)
"map <leader>N <Plug>(miniyank-cycleback)
"" change type
"map <leader>c <Plug>(miniyank-tochar)
"map <leader>l <Plug>(miniyank-toline)
"map <leader>b <Plug>(miniyank-toblock)

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

