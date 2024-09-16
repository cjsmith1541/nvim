return {
	"epwalsh/obsidian.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("plugins.obsidian")
	end,
}
