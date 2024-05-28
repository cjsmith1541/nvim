return {
	"epwalsh/obsidian.nvim",
	version = "*",
	ft = { "markdown", "markdown_inline" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("plugins.obsidian")
	end,
}
