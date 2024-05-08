local map = vim.keymap.set
local noremap = { noremap = true, silent = true }

-- quick focus keybinds
local focusmap = function(direction)
    vim.keymap.set('n', '<Leader>' .. direction, function()
        require('focus').split_command(direction)
    end, { desc = string.format('Create or move to split (%s)', direction) })
end
focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l')

-- General keybinds
map('v', 'J', ":m '>+1<CR>gv=gv", noremap, { desc = "Move highlighted text down"})
map('v', 'K', ":m '<-2<CR>gv=gv", noremap, { desc = "Move highlighted text up"})
map('n', 'J', 'mzJ`z', noremap, { desc = "Paste from outside nvim"})
map('n', '<C-d>', '<C-d>zz', noremap, { desc = "Paste from outside nvim"})
map('n', '<C-u>', '<C-u>zz', noremap, { desc = "Paste from outside nvim"})
map('n', 'n', 'nzzzv', noremap, { desc = "Paste from outside nvim"})
map('n', 'N', 'Nzzzv', noremap, { desc = "Paste from outside nvim"})
map('x', '<leader>p', '"_dP', noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>caw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>x', "<cmd>!chmod +x %<CR>", noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>c', vim.cmd.noh, noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>v', '"+p', noremap, { desc = "Paste from outside nvim"})

-- telescope keybinds
local builtin = require('telescope.builtin')
map('n', '<C-p>', builtin.find_files, {})
map('n', '<C-g>', builtin.live_grep, {})
map('n', '<C-b>', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fk', builtin.keymaps, {})

-- Autosave keybinds
map("n", "<leader>s", ":ASToggle<CR>", {})

-- lazydocker
vim.keymap.set("n", "<leader>lzd", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })

-- oil keybinds
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Undotree keybinds
map('n', '<leader>u', vim.cmd.UndotreeToggle, noremap, { desc = "Paste from outside nvim"})

-- Sniprun keybinds
map('n', '<leader>r', '<Plug>SnipRunOperator', noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>ra', [[:%SnipRun <CR>]], noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>rb', '<Plug>SnipRun', noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>rc', '<Plug>SnipClose', noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>rq', '<Plug>SnipReset', noremap, { desc = "Paste from outside nvim"})
map('v', 'r', '<Plug>SnipRun',  noremap, { desc = "Paste from outside nvim"})

-- Focus keybinds
map('n', '<leader>z', [[:FocusMaxOrEqual <CR>]], noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>;', [[:FocusSplitCycle <CR>]], noremap, { desc = "Paste from outside nvim"})
map('n', '<leader>S', [[:FocusSplitNicely <CR>]], noremap, { desc = "Paste from outside nvim"})

-- LSP keybinds
map("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>gd", vim.lsp.buf.definition, {})
map("n", "<leader>gr", vim.lsp.buf.references, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- DAP Keybinds
map("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
map("n", "<Leader>dc", ":DapContinue<CR>")
map("n", "<Leader>dx", ":DapTerminate<CR>")
map("n", "<Leader>do", ":DapStepOver<CR>")

-- vim-tmux-navigator
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end
