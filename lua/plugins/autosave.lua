local as = require("auto-save")

as.setup({
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		trigger_events = { -- See :h events
			immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
			defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
			cancel_defered_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
		},
		lockmarks = true, -- lock marks when saving, see `:h lockmarks` for more details
	},
})
