return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
	-- tag = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.keybinds"] = {},
				["core.itero"] = {},
				["core.pivot"] = {},
				["core.concealer"] = {
					config = {
						icon_preset = "varied",
					},
				}, -- Adds pretty icons to your documents
				-- ["core.completion"] = {}, -- Core Completion
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							personal = "~/Notes/personal/",
							work = "~/Notes/work/",
							college = "~/Notes/college/",
						},
					},
				},
			},
		})
	end,
}
