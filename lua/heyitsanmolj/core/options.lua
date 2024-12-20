local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabbing and intendation
opt.tabstop = 2
opt.shiftwidth = 2
-- Define settings for PHP files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "php",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.colorcolumn = "100"
opt.updatetime = 50

vim.lsp.set_log_level("warn")
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.clipboard:append("unnamedplus")

vim.filetype.add({
	extension = {
		ejs = "html",
	},
})

vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {

		group = vim.api.nvim_create_augroup("Yank", { clear = true }),

		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end
