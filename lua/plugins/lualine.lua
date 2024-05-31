local ll = require("lualine")

ll.setup({
	opts = {
		theme = "gruvbox_dark",
		sections = {
			lualine_c = { "filename", file_status = true },
			lualine_x = { "filetype", "fileformat", "filetype" },
		},
	},
})
