" --------
" PLUGINS
" --------

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

    " tagbar
    Plug 'preservim/tagbar'

    " file tree
    Plug 'kyazdani42/nvim-tree.lua'

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
  endif

  " actions / utilities
  Plug 'bfredl/nvim-miniyank'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'andymass/vim-matchup'
call plug#end()


let g:material_colorscheme_map = {}

lua <<EOF
-- OPTIONS
vim.o.encoding = "utf-8"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.paste = false
vim.o.number = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showtabline = 2
vim.o.softtabstop = 2
vim.o.scrolloff = 999
vim.o.guifont = "Fira Code iCursive Op:h11"
vim.o.pyxversion = 3
vim.o.termguicolors = true
vim.o.background = 'dark'

-- GLOBALS
vim.g.mapleader = ' '
vim.g.indentLine_char = '.'
vim.g.blamer_enabled = 1
vim.g.blamer_date_format = '%Y-%m-%d %H:%M'
vim.g.blamer_relative_time = 1
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDDEfaultAlign = 'left'
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDSpaceDelims = 1
vim.g.coc_global_extensions = {
  'coc-emmet',
  'coc-go',
  'coc-inline-jest',
  'coc-json',
  'coc-pairs',
  'coc-phpls',
  'coc-prettier',
  'coc-snippets',
  'coc-tsserver',
  'coc-yank',
  'coc-rust-analyzer'
}
vim.g.vim_markdown_conceal = false
vim.g.vim_markdown_conceal_code_blocks = false
vim.g.everforest_background = 'hard'
-- default, palenight, ocean, lighter, darker, default-community, palenight-community, ocean-community, lighter-community, darker-community
vim.g.material_theme_style = 'ocean'
vim.g.material_terminal_italics = true
-- mirage, dark, light
vim.g.ayucolor = 'mirage'
-- default, atlantis, andromeda, shusia, maia, espresso
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_enable_italic = true
-- dark, aura, neon, light
vim.g.edge_style = 'light'
vim.g.edge_enable_italic = true
-- vim.g.edge_disable_italic_comment = true
-- hard, medium(default), soft
vim.g.gruvbox_material_background = 'soft'
-- material, mix, original
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_diagnostic_text_highlight = true
-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
-- distinguished, minimalist, sol, papercolor, alduin, angr, apprentice, atomic
-- vim.g.airline_theme = 'base16_material'
-- vim.g.airline_powerline_fonts = true

require('bufferline').setup({
  options = {
    numbers = function(opts)
      return string.format('%s', opts.id)
    end,
    show_buffer_close_icons = false,
    separator_style = "slant",
    diagnostics = "coc",
  }
})

require('lualine').setup({ options = { theme = 'material' }})
require('nvim-tree').setup()
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
}
EOF

if !exists('g:vscode')
  colorscheme material
endif

" cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=3\x7"

" ===========
" KEYBINDINGS
" ===========

if exists('g:vscode')
  " navigate tabs
  nmap <silent> t :call VSCodeCall('workbench.action.nextEditor')<CR>
  nmap <silent> T :call VSCodeCall('workbench.action.previousEditor')<CR>
  " open diagnostic window
  nnoremap <C-d> :call VSCodeCall('workbench.panel.markers.view.focus')<CR>
  " navigate markers
  nmap <silent> <Leader>e :call VSCodeCall('editor.action.marker.next')<CR>
  nmap <silent> <Leader>E :call VSCodeCall('editor.action.marker.prev')<CR>
  " navigate code
  nmap <silent> gd :call VSCodeCall('editor.action.revealDefinition')<CR>
  nmap <silent> gy :call VSCodeCall('editor.action.goToTypeDefinition')<CR>
  nmap <silent> gY :call VSCodeCall('editor.action.peekTypeDefinition')<CR>
  nmap <silent> gi :call VSCodeCall('editor.action.goToImplementation')<CR>
  nmap <silent> gI :call VSCodeCall('editor.action.peekImplementation')<CR>
  nmap <silent> gr :call VSCodeCall('editor.action.goToReferences')<CR>
else
  " create new tab
  nnoremap <C-t> :tabnew<CR>
  " next/previous tab
  nnoremap t :tabnext<CR>
  nnoremap T :tabprev<CR>
  " go to tab to the left
  nnoremap <silent> <A-Left> :tabm -1<CR>
  " go to tab to the right
  nnoremap <silent> <A-Right> :tabm +1<CR>
  " clear last search highlight
  nnoremap <C-l> :noh<CR>
  " Spacing for new code block
  inoremap <C-Return> <CR><CR><C-o>k<Tab>
  " Use ctrl-[hjkl] to select the active split!
  nmap <silent> <c-k> :wincmd k<CR>
  nmap <silent> <c-j> :wincmd j<CR>
  nmap <silent> <c-h> :wincmd h<CR>
  " toggle NerdCommenter
  map <C-_> <plug>NERDCommenterToggle
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
  " open file tree
  nnoremap <C-n> :NvimTreeToggle<CR>
  " find file in file tree
  nmap <leader>ff :NvimTreeFindFile<CR>
  " mirror files in file tree
  nmap <leader>fo :NvimTreeFocus<CR>
  " tagbar
  nmap <F8> :TagbarToggle<CR>
  if has('nvim')
    " use <c-space> to trigger completion
    inoremap <silent><expr> <c-space> coc#refresh()
    " apply codeAction to the current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " quick fix the current line
    nmap <leader>qf  <Plug>(coc-fix-current)
    " open diagnostic window
    nnoremap <C-d> :CocDiagnostics<CR>
    " navigate markers
    nmap <silent> <Leader>e <Plug>(coc-diagnostic-next)
    nmap <silent> <Leader>E <Plug>(coc-diagnostic-prev)
    " navigate code
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    " rename current word
    nmap <F2> <Plug>(coc-rename)
    " format with prettier
    vmap <leader>pr  <Plug>(coc-format-selected)
    nmap <leader>pr  <Plug>(coc-format-selected)
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

" use jk to escape
imap jk <Esc>
" use H to navigate to start of text
nnoremap H ^
" use L to navigate to end of line
nnoremap L g_
" go to next instance of two characters
map <leader>f <Plug>Sneak_s
" go to previous instance of two characters
map <leader>F <Plug>Sneak_S

" MINIYANK
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
" directly put the most recent item in the shared history
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
" right after a put, use cycle to go through history
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)
" change type
map <leader>c <Plug>(miniyank-tochar)
map <leader>l <Plug>(miniyank-toline)
map <leader>b <Plug>(miniyank-toblock)

" easymotion
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

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

