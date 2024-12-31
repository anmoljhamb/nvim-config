return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		vim.treesitter.language.register("html", "ejs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"javascript",
				"html",
				"typescript",
				"tsx",
				"cpp",
				-- "rust",
				"python",
				"dart",
			},
			textobjects = {
				enable = true,
				select = {
					enable = true,
					keymaps = {
						["af"] = "@function.outer", -- select around function
						["if"] = "@function.inner", -- select inside function
						["ac"] = "@class.outer", -- select around class
						["ic"] = "@class.inner", -- select inside class
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			additional_vim_regex_highlighting = true,
			rainbow = {
				enable = false,
				-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
		})
	end,
}
