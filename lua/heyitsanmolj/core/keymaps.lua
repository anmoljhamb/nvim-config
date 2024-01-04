vim.g.mapleader = " "

local km = vim.keymap

---------------------
-- General Keymaps
---------------------

---------------------
-- Insert Keybindings
---------------------
--
-- use jk to exit insert mode
km.set("i", "jk", "<ESC>")
km.set("i", "<A-BS>", "<C-W>")
km.set("i", "<C-H>", "<C-W>")

---------------------
-- Normal Keybindings
---------------------
--
-- clear search highlights
km.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
km.set("n", "x", '"_x')

-- increment/decrement numbers
km.set("n", "<leader>+", "<C-a>") -- increment
km.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
km.set("n", "<leader>sv", "<C-w>v") -- split window vertically
km.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
km.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
km.set("n", "<leader>sx", ":close<CR>") -- close current split window

km.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
km.set("n", "<leader>tw", ":tabclose<CR>") -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
km.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

---------------------
-- Visual Keybindings
---------------------
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
---------------------
-- Plugin Keybindings
---------------------
--
km.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- NvimTreeToggle
km.set("n", "<A-b>", ":NvimTreeToggle<CR>")

km.set("n", "<A-p>", ":Telescope git_files<CR>")
km.set("n", "<leader>pf", ":Telescope find_files<CR>")
km.set("n", "<leader>ps", ":Telescope live_grep<CR>")

-- Comments
km.set("n", "<C-_>", "gcc", { remap = true })
km.set("v", "<C-_>", "gc", { remap = true })
km.set("n", "<A-/>", "gcc", { remap = true })
km.set("v", "<A-/>", "gc", { remap = true })
km.set("i", "<C-_>", "<Esc>gccA ", { remap = true })

-- Fugitve
--
km.set("n", "<leader>gs", ":Git<CR>")

-- Harpoon
--
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-1>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<A-2>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<A-3>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<A-4>", function()
	ui.nav_file(4)
end)

-- Undo Tree
--
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
