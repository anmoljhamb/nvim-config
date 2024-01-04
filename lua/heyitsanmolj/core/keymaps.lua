vim.g.mapleader = " "

local km = vim.keymap

---------------------
-- General Keymaps
---------------------

---------------------
-- Insert Keybindings
---------------------

-- use jk to exit insert mode
km.set("i", "jk", "<ESC>")
km.set("i", "<A-BS>", "<C-W>")
km.set("i", "<C-H>", "<C-W>")

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

-- plugin keymaps
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
