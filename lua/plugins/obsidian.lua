require("obsidian").setup({
	workspaces = {
		{
			name = "Notes",
			path = "/home/cjsmith/Obsidian/Main",
		},
	},
	completion = {
		nvim_cmp = true,
		min_chars = 1,
	},
	notes_subdir = "0-inbox/",
	new_notes_location = "notes_subdir",
	wiki_link_func = function(opts)
		if opts.id == nil then
			return string.format("[[%s]]", opts.label)
		elseif opts.label ~= opts.id then
			return string.format("[[%s|%s]]", opts.id, opts.label)
		else
			return string.format("[[%s]]", opts.id)
		end
	end,

	daily_notes = {
		-- Optional, if you keep daily notes in a separate directory.
		folder = "5-dailies",
		-- Optional, if you want to change the date format for the ID of daily notes.
		date_format = "%Y-%m-%d",
		-- Optional, if you want to change the date format of the default alias of daily notes.
		alias_format = "%B %-d, %Y",
		-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
		template = nil,
	},

	mappings = {
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
		-- Smart action depending on context, either follow link or toggle checkbox.
		["<cr>"] = {
			action = function()
				return require("obsidian").util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		},
	},
	note_frontmatter_func = function(note)
		-- This is equivalent to the default frontmatter function.
		local out = { id = note.id, aliases = note.aliases, tags = note.tags }

		-- `note.metadata` contains any manually added fields in the frontmatter.
		-- So here we just make sure those fields are kept in the frontmatter.
		if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
			for k, v in pairs(note.metadata) do
				out[k] = v
			end
		end
		return out
	end,
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		-- In this case a note with the title 'My new note' will be given an ID that looks
		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = string.char(math.random(65, 90)) .. suffix
			end
		end
		return suffix .. "-" .. tostring(os.time())
	end,
	-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
	-- URL it will be ignored but you can customize this behavior here.
	---@param url string
	follow_url_func = function(url)
		vim.fn.jobstart({ "xdg-open", url }) -- linux
	end,
	templates = {
		folder = "templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		-- A map for custom variables, the key should be the variable and the value a function
		substitutions = {},
	},
	callbacks = {
		-- Runs anytime you leave the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		---@diagnostic disable-next-line: unused-local
		leave_note = function(client, note)
			vim.api.nvim_buf_call(note.bufnr or 0, function()
				vim.cmd("silent w")
			end)
		end,
	},
	-- Optional, configure additional syntax highlighting / extmarks.
	-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
	ui = {
		max_file_length = 10000, -- disable UI features for files with more than this many lines
		-- Define how various check-boxes are displayed
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo", order = 1 },
			["x"] = { char = "", hl_group = "ObsidianDone", order = 2 },
			[">"] = { char = "", hl_group = "ObsidianRightArrow", order = 3 },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde", order = 4 },
			["!"] = { char = "", hl_group = "ObsidianImportant", order = 5 },
		},
	},
})
