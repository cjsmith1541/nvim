return {
	"okuuva/auto-save.nvim",
	lazy = true,
	ft = { "markdown", "tex" },
	config = function()
		require("plugins.autosave")
	end,
}
