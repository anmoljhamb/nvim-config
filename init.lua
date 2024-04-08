require("heyitsanmolj")

local km = vim.keymap
if vim.g.vscode then
	vim.g.mapleader = " "
	vim.g.maplocalleader = ";"
	vim.cmd("nmap <leader>c :e ~/.config/nvim/init.lua<CR>")
	print("Loading the nvim config")
end
