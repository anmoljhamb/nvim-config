return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local km = vim.keymap

		km.set("n", "<leader>a", mark.add_file)
		km.set("n", "<C-e>", ui.toggle_quick_menu)

		for i = 1, 10 do
			km.set("n", "<A-" .. i .. ">", function()
				ui.nav_file(i)
			end)
		end
	end,
}
