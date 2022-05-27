-- GLOBALS
vim.g.indentLine_char = '.'
vim.g.mapleader = ' '
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g['&t_SI'] = "<Esc>]50;CursorShape=1x7"
vim.g['&t_SR'] = "<Esc>]50;CursorShape=2x7"
vim.g['&t_EI'] = "<Esc>]50;CursorShape=3x7"

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

  -- dap ui
  require("dapui").setup()

  -- dap virtual text
  require("nvim-dap-virtual-text").setup()

  -- fzf
  vim.env.FZF_DEFAULT_OPTS = "--layout=reverse"

  -- github copilot
  vim.g.copilot_no_tab_map = 1

  -- lualine
  require('lualine').setup({
    options = {
      theme = 'material',
      section_separators = { left = '', right = '' },
    },
    sections = {
      -- default values
      --lualine_a = {'mode'},
      --lualine_b = {'branch', 'diff', 'diagnostics'},
      --lualine_c = {'filename'},
      --lualine_x = {'encoding', 'fileformat', 'filetype'},
      --lualine_y = {'progress'},
      --lualine_z = {'location'}
      lualine_c = {'%.40F'},
    }
  })

  -- nvim-dap
  local dap = require('dap')
  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {vim.fn.stdpath("data") .. "/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js"}
  }

  dap.configurations.javascript = {
      {
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}"
      }
  }

  dap.configurations.typescript = {
      {
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}"
      }
  }

  dap.configurations.javascriptreact = {
      {
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}"
      }
  }

  dap.configurations.typescriptreact = {
      {
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}"
      }
  }

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

-- vimspector
--vim.g.vimspector_enable_mappings = 'HUMAN'

-- vim test
vim.g['test#javascript#jest#options'] = "--color=always"

-- vista
--vim.cmd [[
  --function! NearestMethodOrFunction() abort
  --return get(b:, 'vista_nearest_method_or_function', '')
  --endfunction
--]]

--vim.o.statusline = vim.o.statusline .. "%{NearestMethodOrFunction()}"

--vim.cmd[[
  --autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
--]]

--" MINIYANK
--"map p <Plug>(miniyank-autoput)
--"map P <Plug>(miniyank-autoPut)
--"" directly put the most recent item in the shared history
--"map <leader>p <Plug>(miniyank-startput)
--"map <leader>P <Plug>(miniyank-startPut)
--"" right after a put, use cycle to go through history
--"map <leader>n <Plug>(miniyank-cycle)
--"map <leader>N <Plug>(miniyank-cycleback)
--"" change type
--"map <leader>c <Plug>(miniyank-tochar)
--"map <leader>l <Plug>(miniyank-toline)
--"map <leader>b <Plug>(miniyank-toblock)
