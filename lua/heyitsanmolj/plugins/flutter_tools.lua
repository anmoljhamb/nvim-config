return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			widget_guides = {
				enabled = false,
			},
			closing_tags = {
				highlight = "ErrorMsg", -- highlight for the closing tag
				prefix = ">", -- character to use for close tag e.g. > Widget
				enabled = false, -- set to false to disable
			},
		})
	end,
}
