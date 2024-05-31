require("nvim-treesitter.configs").setup({
	modules = {},
	ensure_installed = { "markdown", "rust", "cpp", "c", "lua", "python", "css", "html", "bash" },
	sync_install = true,
	auto_install = true,
	ignore_install = { "latex" },
	highlight = {
		enable = true,
		indent = { enable = true },
		additional_vim_regex_highlighting = false,
	},
})
