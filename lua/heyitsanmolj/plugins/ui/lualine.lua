return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local local_theme = require("lualine.themes.nightfly")
		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						function()
							-- Count the number of open buffers
							local buffers = vim.tbl_filter(function(buf)
								return vim.api.nvim_buf_is_loaded(buf)
							end, vim.api.nvim_list_bufs())
							return #buffers
						end,
						-- Optional icon
						icon = "", -- Or any other icon
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			opts = {
				theme = local_theme,
			},
		})
	end,
}
