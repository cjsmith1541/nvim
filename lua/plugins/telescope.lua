require("telescope").setup({
	extensions = {
		wrap_results = true,
		fzf = {},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-f><C-f>", builtin.find_files)
vim.keymap.set("n", "<C-f>g", builtin.git_files)
vim.keymap.set("n", "<C-f>b", builtin.buffers)
vim.keymap.set("n", "<C-f>m", builtin.marks)
vim.keymap.set("n", "<C-f>k", builtin.keymaps)
vim.keymap.set("n", "<C-f>t", builtin.help_tags)
vim.keymap.set("n", "<C-f>r", builtin.registers)
vim.keymap.set("n", "<C-f>g", builtin.live_grep)
vim.keymap.set("n", "<C-f>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<C-f>s", builtin.spell_suggest)

vim.keymap.set("n", "<C-f>a", builtin.grep_string)

vim.keymap.set("n", "<C-f>c", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end)
