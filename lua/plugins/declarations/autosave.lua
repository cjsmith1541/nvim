return {
	"okuuva/auto-save.nvim",
	ft = { "markdown", "latex" },
	config = function()
		require("plugins.autosave")
	end,
}
