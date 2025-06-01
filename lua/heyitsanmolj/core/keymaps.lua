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
km.set("n", "<C-s>", ":w!<CR>", { desc = "Force Save a file" })
km.set("n", "<A-s>", ":noautocmd write<CR>", { desc = "Save file without formatting" })

-- delete single character without copying into register
km.set("n", "x", '"_x', { desc = "Delete without copying" })

-- increment/decrement numbers
km.set("n", "<leader>+", "<C-a>", { desc = "Increment by 1" })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement by 1" })

-- window management
km.set("n", "<leader>wm", ":MaximizerToggle<CR>", { desc = "Maximize Current Window" })
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split Windows Horizontally" })
km.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" }) --
km.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" })

km.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })
km.set("n", "<A-t>", ":tabnew<CR>", { desc = "New Tab" })
km.set("n", "<leader>tw", ":tabclose<CR>", { desc = "Close Tab" })
-- km.set("n", "<Tab>", ":tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
km.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
km.set("n", "<S-Tab>", ":tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

km.set("n", "n", "nzzzv", { desc = "Center while searching" })
km.set("n", "N", "Nzzzv", { desc = "Center while searching" })
km.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
km.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file" })
km.set("n", "<A-q>", "<cmd>copen<CR>", { desc = "Open quick fix list" })
km.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quick fix" })
km.set("n", "]Q", "<cmd>clast<CR>zz", { desc = "Last quick fix" })
km.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous quick fix" })
km.set("n", "[Q", "<cmd>cfirst<CR>zz", { desc = "First quick fix" })

km.set("n", "<leader>ol", ":e#<CR>", { desc = "Open previously opened file" })
km.set("n", "<A-q>", ":q!<CR>", { desc = "Close Neovim" })
km.set("n", "<A-w>", ":bd!<CR>", { desc = "Close current buffer" })
km.set("n", "<leader>bc", function()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
			vim.cmd("bdelete " .. buf)
		end
	end
end, { desc = "Close all buffers except the current one" })

km.set("n", "<leader>oi", ":OrganizeImports<CR>", { desc = "Organize Imports" })

---------------------
-- Visual Keybindings
---------------------
--
km.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
km.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })
km.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

---------------------
-- Plugin Keybindings
---------------------
--

-- NvimTreeToggle
km.set("n", "<A-b>", ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>", { desc = "Toggle NvimTree", silent = true })

-- Telescope
-- Files
km.set("n", "<A-p>", ":Telescope git_files<CR>", { desc = "Telescope Git Files" })
km.set("n", "<leader>pf", ":Telescope find_files<CR>", { desc = "Telescope All Files" })
km.set("n", "<leader>ps", ":Telescope live_grep<CR>", { desc = "Telescope Search in Current Directory" })
km.set("n", "<A-o>", ":Telescope buffers<CR>", { desc = "Telescope Open Buffers" })

-- Help
km.set("n", "<leader>h?", ":Telescope help_tags<CR>", { desc = "Telescope Find help tags" })
km.set("n", "<leader>k?", ":Telescope keymaps<CR>", { desc = "Telescope List keymaps" })
km.set("n", "<leader>c?", ":Telescope commands<CR>", { desc = "Telescope Find commands" })
km.set("n", "<leader>gbs", ":Telescope git_branches<CR>", { desc = "Telescope Search Git branches" })

-- Additional features
km.set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Search in current buffer" })

-- Git
km.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Telescope Search Git branches" })
km.set("n", "<leader>gc", ":Telescope git_commits<CR>", { desc = "Telescope Search Git commits" })

-- misc
km.set("n", "<leader>tr", ":Telescope resume<CR>", { desc = "Resume last Telescope search" })

-- Comments
-- todo add a command to properly indent the comments
km.set("n", "<C-_>", "gcc", { remap = true, desc = "Comment" })
km.set("v", "<C-_>", "gc", { remap = true, desc = "Comment" })
km.set("i", "<C-_>", "<Esc>gccA ", { remap = true, desc = "Comment" })

-- Fugitve
--
km.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
km.set("n", "<leader>gb", ":G blame<CR>", { desc = "Git Blame" })
km.set("n", "<leader>gft", ":G fetch<CR>", { desc = "Git Fetch" })

-- Undo Tree
--
km.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndoTree" })

-- Vim TMUX Navigator
--
km.set("n", "<c-h>", ":TmuxNavigateLeft<CR>", { desc = "Tmux navigate", silent = true })
km.set("n", "<c-j>", ":TmuxNavigateDown<CR>", { desc = "Tmux navigate", silent = true })
km.set("n", "<c-k>", ":TmuxNavigateUp<CR>", { desc = "Tmux navigate", silent = true })
km.set("n", "<c-l>", ":TmuxNavigateRight<CR>", { desc = "Tmux navigate", silent = true })

-- LSP
--
km.set("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP Info" })

-- Liveserver
km.set("n", "<A-l>", ":LiveServerStart<CR>", { desc = "Live Server" })
km.set("n", "<A-S-l>", ":LiveServerStop<CR>", { desc = "Live Server" })

km.set("n", "<leader>yf", "ggVGy<c-o>", { desc = "Yank the current file" })

-- Source
km.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source the NeoVim config" })
km.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute the current line" })
km.set("v", "<leader>x", ":lua<CR>", { desc = "Execute the current selection" })

-- Fold
km.set("v", "<leader>fc", ":<C-U>'<,'>foldclose<CR>", { noremap = true, silent = true })
km.set("v", "<leader>fo", ":<C-U>'<,'>foldopen<CR>", { noremap = true, silent = true })

km.set("n", "<leader>bu", ":DBUIToggle<CR>")
