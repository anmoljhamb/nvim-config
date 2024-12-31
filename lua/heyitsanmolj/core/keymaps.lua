vim.g.mapleader = " "
vim.g.maplocalleader = ";"

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
km.set("n", "<C-s>", ":w!<CR>")

-- delete single character without copying into register
km.set("n", "x", '"_x')
km.set("v", "x", '"_x')

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
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")
km.set({ "n", "v" }, "<leader>y", [["+y]])
km.set("n", "<leader>Y", [["+Y]])
km.set({ "n", "v" }, "<leader>d", [["_d]])
km.set("n", "<leader>f", vim.lsp.buf.format)
km.set("n", "<A-q>", "<cmd>copen<CR>")
km.set("n", "]q", "<cmd>cnext<CR>zz")
km.set("n", "]Q", "<cmd>clast<CR>zz")
km.set("n", "[q", "<cmd>cprev<CR>zz")
km.set("n", "[Q", "<cmd>cfirst<CR>zz")
km.set("n", "<leader>k", "<cmd>lnext<CR>zz")
km.set("n", "<leader>j", "<cmd>lprev<CR>zz")
km.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]])
km.set("n", "<A-q>", ":q!<CR>")
km.set("n", "<A-w>", ":bd<CR>", { desc = "Close current buffer" })
km.set("n", "<A-d>", "<C-n>", { remap = true })
km.set("n", "<leader>oi", ":OrganizeImports<CR>")

---------------------
-- Visual Keybindings
---------------------
--
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")
km.set("x", "<leader>p", [["_dP]])
---------------------
-- Plugin Keybindings
---------------------
--
km.set("n", "<leader>wm", ":MaximizerToggle<CR>")

-- NvimTreeToggle
km.set("n", "<A-b>", ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>", { desc = "Toggle NvimTree" })

-- Telescope
-- Files
km.set("n", "<A-p>", ":Telescope git_files<CR>", { desc = "Git Files" })
km.set("n", "<leader>pf", ":Telescope find_files<CR>", { desc = "All Files" })
km.set("n", "<leader>ps", ":Telescope live_grep<CR>", { desc = "Search in Current Directory" })
km.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Search Git branches" })
km.set("n", "<A-o>", ":Telescope buffers<CR>", { desc = "Open Buffers" })

-- Help
km.set("n", "<leader>h?", ":Telescope help_tags<CR>", { desc = "Find help tags" })
km.set("n", "<leader>k?", ":Telescope keymaps<CR>", { desc = "List keymaps" })
km.set("n", "<leader>c?", ":Telescope commands<CR>", { desc = "Find commands" })
km.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Search Git branches" })

-- Additional features
km.set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in current buffer" })

-- Git
km.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Search Git branches" })
km.set("n", "<leader>gc", ":Telescope git_commits<CR>", { desc = "Search Git commits" })

-- misc
km.set("n", "<leader>tr", ":Telescope resume<CR>", { desc = "Resume last Telescope search" })

-- Comments
-- todo add a command to properly indent the comments
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

-- Undo Tree
--
km.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Vim TMUX Navigator
--
km.set("n", "<c-h>", ":TmuxNavigateLeft<CR>")
km.set("n", "<c-j>", ":TmuxNavigateDown<CR>")
km.set("n", "<c-k>", ":TmuxNavigateUp<CR>")
km.set("n", "<c-l>", ":TmuxNavigateRight<CR>")

-- LSP
--
km.set("n", "<leader>li", ":LspInfo<CR>")

-- Liveserver
km.set("n", "<A-l>", ":LiveServerStart<CR>")
km.set("n", "<A-S-l>", ":LiveServerStop<CR>")

km.set("n", "<leader>yf", "ggVGy<c-o>")

-- Source
km.set("n", "<leader><leader>x", "<cmd>source %<CR>")
km.set("n", "<leader>x", ":.lua<CR>")
km.set("v", "<leader>x", ":lua<CR>")
