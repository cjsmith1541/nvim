return {
	{
		"kevinhwang91/nvim-bqf",
		enabled = false,
		config = function()
			require("bqf").setup({
                auto_resize_height = true,
            })
		end,
	},
	{
		"stevearc/qf_helper.nvim",
		opts = {},
	},
}
