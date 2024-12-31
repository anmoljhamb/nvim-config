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
km.set("i", "jk", "<ESC>", { desc = "Escape to normal mode" })
km.set("i", "<A-BS>", "<C-W>", { desc = "Erase via words" })
km.set("i", "<C-H>", "<C-W>", { desc = "Erase via words" })

---------------------
-- Normal Keybindings
---------------------
--
-- clear search highlights
km.set("n", "<C-s>", ":w!<CR>", { desc = "Force Save a file" })
km.set("n", "<A-s>", ":noautocmd write<CR>", { desc = "Save file without formatting" })

-- delete single character without copying into register
km.set("n", "x", '"_x', { desc = "Delete without copying" })
km.set("v", "x", '"_x', { desc = "Delete without copying" })

-- increment/decrement numbers
km.set("n", "<leader>+", "<C-a>", { desc = "Increment by 1" })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement by 1" })

-- window management
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split Windows Horizontally" })
km.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" }) --
km.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })

km.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })
km.set("n", "<A-t>", ":tabnew<CR>", { desc = "New Tab" })
km.set("n", "<leader>tw", ":tabclose<CR>", { desc = "Close Tab" })
km.set("n", "<Tab>", ":tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
km.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
km.set("n", "<S-Tab>", ":tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

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
