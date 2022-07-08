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
    Plug 'sainnhe/everforest'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/sonokai'
    Plug 'sjl/badwolf'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'morhetz/gruvbox'
    Plug 'jsit/toast.vim'
    Plug 'AlessandroYorba/Alduin'
    Plug 'mswift42/vim-themes'
    Plug 'fcpg/vim-fahrenheit'
    Plug 'kadekillary/skull-vim'
    Plug 'tristen/superman'
    Plug 'HenryNewcomer/vim-theme-papaya'

    " buffer and status lines
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim'
    Plug 'nvim-lualine/lualine.nvim'

    " file tree
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'liuchengxu/vista.vim'
    Plug 'ludovicchabant/vim-gutentags'

    " syntax highlighting / snippets / formatting
    Plug 'HerringtonDarkholme/yats.vim' " typescript highlighting
    "Plug 'mattn/emmet-vim' " emmet
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
    Plug 'mfussenegger/nvim-dap'
    Plug 'Pocco81/DAPInstall.nvim'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'
    "Plug 'puremourning/vimspector'

    "testing
    Plug 'vim-test/vim-test'
    Plug 'rcarriga/vim-ultest', { 'do': ':updateremoteplugins' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'rcarriga/neotest'
    Plug 'rcarriga/neotest-vim-test'
    Plug 'haydenmeade/neotest-jest'

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
  "Plug 'justinmk/vim-sneak'
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
  " favorites: everforest, badwolf, monokai_pro, nord, gruvbox, gruvbox-material, alduin, reykjavik, darktooth, fahrenheit, skull, superman

  " material, monokai_pro, nord, gruvbox-material, deus, ayu, falcon, everforest, sonokai, badwolf, toast, alduin

  colorscheme gruvbox-material
endif

lua <<EOF
require('coc')
require('settings')
require('keymaps')
require('themes')
EOF

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

execute pathogen#infect()
