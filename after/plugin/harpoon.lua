local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

for i = 1, 6, 1
	do 
		temp = "<A-%d>"
		vim.keymap.set("n", string.format(temp, i), function() ui.nav_file(i) end)
	end

