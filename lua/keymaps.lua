local map = vim.keymap.set

map("n", "J", "mzJ`z", { desc = "Keep vison on end of J command" })
map("n", "<C-d>", "<C-d>zz", { desc = "Centers text when jumping with Ctrl-d" })
map("n", "<C-u>", "<C-u>zz", { desc = "Centers text when jumping with Ctrl-u" })
map("n", "n", "nzzzv", { desc = "Centers text when using n to jump" })
map("n", "N", "Nzzzv", { desc = "Centers text when using N to jump" })
map("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })
map("n", "<C-M-h>", "<c-w>5<", { desc = "Expand pane left" })
map("n", "<C-M-l>", "<c-w>5>", { desc = "Expand pane right" })
map("n", "<C-M-j>", "<C-w>-", { desc = "Expand pane down" })
map("n", "<C-M-k>", "<C-w>+", { desc = "Expand pane up" })
map("n", "<C-w>j", "<C-w>s", { desc = "open new window below" })
map("n", "<C-w><C-j>", "<C-w>s", { desc = "open new window below" })
map("n", "<C-w>k", "<C-w>v", { desc = "open new window to the right" })
map("n", "<C-w><C-k>", "<C-w>v", { desc = "open new window to the right" })
map("n", "<C-w>l", ":tabn<CR>", { desc = "jump to next tab on the right" })
map("n", "<C-w><C-l>", ":tabn<CR>", { desc = "jump to next tab on the right" })
map("n", "<C-w>h", ":tabp<CR>", { desc = "jump to next tab on the left" })
map("n", "<C-w><C-h>", ":tabp<CR>", { desc = "jump to next tab on the left" })
map("n", "gt", ":tabnew<CR>", { desc = "jump to next tab on the left" })
map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Toggle Lazy" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })
map("n", "<M-j>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! ]c]])
	else
		vim.cmd([[m .+1<CR>==]])
	end
end, { desc = "jump to diff or swap current line with line bellow" })
map("n", "<M-k>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! [c]])
	else
		vim.cmd([[m .-2<CR>==]])
	end
end, { desc = "jump to diff or swap current line with line bellow" })
map("n", "<CR>", function()
	if vim.opt.hlsearch:get() then
		vim.cmd.nohl()
		return ""
	else
		return "<CR>"
	end
end, { desc = "jump to diff or swap current line with line bellow" })
