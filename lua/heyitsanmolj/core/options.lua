local opt = vim.opt

vim.g.loaded_python3_provider = 0

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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "docker-compose*.yml", "docker-*.yml" },
	command = "set filetype=yaml.docker-compose",
})

-- Fold
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local file_open_augroup = vim.api.nvim_create_augroup("file-open-timings", { clear = true })

vim.api.nvim_create_autocmd("BufReadPre", {
	group = file_open_augroup,
	callback = function(args)
		vim.b[args.buf].file_open_start = vim.loop.hrtime()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = file_open_augroup,
	callback = function(args)
		local start_time = vim.b[args.buf].file_open_start
		if start_time then
			local elapsed_ms = (vim.loop.hrtime() - start_time) / 1e6
			local file_name = vim.api.nvim_buf_get_name(args.buf)
			local msg = string.format(
				"File '%s' opened in %.2f ms",
				vim.fn.fnamemodify(file_name, ":t"), -- Get just the filename
				elapsed_ms
			)
			vim.notify(msg, vim.log.levels.INFO)

			vim.b[args.buf].file_open_start = nil

			local logfile = vim.fn.stdpath("data") .. "/file_open_times.log"
			local f = io.open(logfile, "a")
			if f then
				f:write(os.date("%Y-%m-%d %H:%M:%S") .. " " .. msg .. "\n")
				f:close()
			end
		end
	end,
})
