-- GLOBALS
vim.g.indentLine_char = '.'
vim.g.mapleader = ' '
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- OPTIONS
vim.o.background = 'dark'
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.guifont = "Fira Code iCursive Op:h11"
vim.o.ignorecase = true
vim.o.number = true
vim.o.paste = false
vim.o.pyxversion = 3
vim.o.scrolloff = 999
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true

if (vim.g.vscode)
then
  print('in vscode')
else
  print('NOT in vscode')
  -- (git) blamer
  vim.g.blamer_date_format = '%Y-%m-%d %H:%M'
  vim.g.blamer_enabled = 1
  vim.g.blamer_relative_time = 1

  -- bufferline
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

  -- lualine
  require('lualine').setup({ options = { theme = 'material', section_separators = { left = '', right = '' }, }})

  -- nvim-tree
  vim.g.nvim_tree_git_hl = 1 -- highlight git changed files
  vim.g.nvim_tree_highlight_opened_files = 1 -- highlight open files

  require('nvim-tree').setup({
    actions = {
      open_file = {
        quit_on_open = true -- quit when opening file
      }
    }
  })

  -- nvim-treesitter
  require'nvim-treesitter.configs'.setup {
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
  }
end

-- easymotion
vim.g.EasyMotion_smartcase = 1 -- case insensitive

