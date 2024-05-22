return {
	{
		"3rd/image.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
			},
		},
		config = function()
			require("plugins.image")
		end,
	},
}
