local map = vim.api.nvim_set_keymap

-- exit insert mode with 'jk'
map('i', 'jk', '<Esc>', {noremap = false})

-- use H to navigate to start of text
map('n', 'H', '^', {noremap = true})

-- use L to navigate to end of line
map('n', 'L', 'g_', {noremap = true})

-- go to next/previous instance of two characters
--map('', '<Leader>f', '<Plug>Sneak_s', {noremap = false})
--map('', '<Leader>F', '<Plug>Sneak_S', {noremap = false})
--map('', '<Leader>s', '<Plug>Sneak_s', {noremap = false})
--map('', '<Leader>S', '<Plug>Sneak_S', {noremap = false})

-- easymotion search
map('', '<Leader>s', '<Plug>(easymotion-s)', {noremap = false})
-- easymotion JK motions: Line motions
map('', '<Leader><Leader>j', '<Plug>(easymotion-j)', {noremap = false})
map('', '<Leader><Leader>k', '<Plug>(easymotion-k)', {noremap = false})
-- easymotion word motions
map('', '<Leader><Leader>W', '<Plug>(easymotion-W)', {noremap = false})
map('', '<Leader><Leader>E', '<Plug>(easymotion-E)', {noremap = false})

if (vim.g.vscode)
then
  -- navigate tabs
  map('n', 't', ':call VSCodeCall("workbench.action.nextEditor")<CR>', {noremap = false})
  map('n', 'T', ':call VSCodeCall("workbench.action.previousEditor")<CR>', {noremap = false})
  -- open diagnostic window (doesn't work)
  --map('n', '<C-d>', ':call VSCodeCall("workbench.panel.markers.view.focus")<CR>', {noremap = true})
  -- navigate markers
  map('n', 'm', ':call VSCodeCall("editor.action.marker.next")<CR>', {noremap = false})
  map('n', 'M', ':call VSCodeCall("editor.action.marker.prev")<CR>', {noremap = false})
  -- navigate code
  map('n', 'gd', ':call VSCodeCall("editor.action.revealDefinition")<CR>', {noremap = false})
  map('n', 'gt', ':call VSCodeCall("editor.action.goToTypeDefinition")<CR>', {noremap = false})
  map('n', 'gT', ':call VSCodeCall("editor.action.peekTypeDefinition")<CR>', {noremap = false})
  map('n', 'gi', ':call VSCodeCall("editor.action.goToImplementation")<CR>', {noremap = false})
  map('n', 'gI', ':call VSCodeCall("editor.action.peekImplementation")<CR>', {noremap = false})
  map('n', 'gr', ':call VSCodeCall("editor.action.goToReferences")<CR>', {noremap = false})
else
  -- navigate tabs (buffers)
  map('n', 't', ':bnext<CR>', {noremap = true})
  map('n', 'T', ':bprev<CR>', {noremap = true})
  -- Use ctrl-[hjkl] to select the active split!
  map('n', '<C-h>', ':wincmd h<CR>', {noremap = false})
  map('n', '<C-j>', ':wincmd j<CR>', {noremap = false})
  map('n', '<C-k>', ':wincmd k<CR>', {noremap = false})
  map('n', '<C-l>', ':wincmd l<CR>', {noremap = false})
  -- find file
  map('n', '<C-p>', ':FZF<CR>', {noremap = true})
  map('n', '<Leader>ff', ':FZF<CR>', {noremap = true})
  -- find string in all files
  map('n', '<C-f>', ':Ag<CR>', {noremap = true})
  map('n', '<Leader>ag', ':Ag<CR>', {noremap = true})
  map('n', '<Leader>gg', ':Ag<CR>', {noremap = true})
  -- view git status
  map('n', '<C-g>', ':GFiles?<CR>', {noremap = true})
  map('n', '<Leader>gf', ':GFiles?<CR>', {noremap = true})
  -- view buffers
  map('n', '<C-b>', ':Buffers<CR>', {noremap = true})
  map('n', '<Leader>bf', ':Buffers<CR>', {noremap = true})
  -- open file tree
  map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
  -- open diagnostic window
  map('n', '<C-d>', ':CocDiagnostics<CR>', {noremap = true})
  -- view git history of buffer
  map('n', '<Leader>gh', ':BCommits<CR>', {noremap = true})
  -- find file in file tree
  map('n', '<Leader>nn', ':NvimTreeFindFile<CR>', {noremap = false})
  -- mirror files in file tree
  map('n', '<Leader>nm', ':NvimTreeFocus<CR>', {noremap = false})
  -- navigate diagnostic markers
  map('n', 'm', '<Plug>(coc-diagnostic-next)', {noremap = false})
  map('n', 'M', '<Plug>(coc-diagnostic-prev)', {noremap = false})
  -- apply codeAction to the current line
  map('n', '<Leader>aa', '<Plug>(coc-codeaction)', {noremap = false})
  map('n', '<Leader>ca', '<Plug>(coc-codeaction)', {noremap = false})
  -- quick fix the current line
  map('n', '<Leader>cf', '<Plug>(coc-fix-current)', {noremap = false})
  -- navigate code
  map('n', 'gd', '<Plug>(coc-definition)', {noremap = false})
  map('n', 'gt', '<Plug>(coc-type-definition)', {noremap = false})
  map('n', 'gi', '<Plug>(coc-implementation)', {noremap = false})
  map('n', 'gr', '<Plug>(coc-references)', {noremap = false})
  -- format with prettier
  map('v', '<Leader>pr', '<Plug>(coc-format-selected)', {noremap = false})
  map('n', '<Leader>pr', '<Plug>(coc-format-selected)', {noremap = false})
  -- toggle tagbar
  map('n', '<Leader>mm', ':Vista coc<CR>', {noremap = false})
  map('n', '<Leader>mt', ':Vista!<CR>', {noremap = false})
  -- accept copliot suggestion with leader + cp
  map('i', '<C-c>', 'copilot#Accept("<CR>")', {noremap = false, expr = true, silent = true})
  -- navigate auto complete
  map('i', '<C-j>', '<C-n>', {noremap = true})
  map('i', '<C-k>', '<C-p>', {noremap = true})
  -- debugger
  -- tests
  map('n', '<Leader>ta', ':Ultest<CR>', {noremap = false})
  map('n', '<Leader>tn', ':UltestNearest<CR>', {noremap = false})
  map('n', '<Leader>td', ':UltestDebug<CR>', {noremap = false})
  map('n', '<Leader>ts', ':UltestSummary!<CR>', {noremap = false})
  map('n', '<Leader>tc', ':UltestClear<CR>', {noremap = false})
end
