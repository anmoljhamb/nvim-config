local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "heyitsanmolj.plugins" },
	{ import = "heyitsanmolj.plugins.lsp" },
	{ import = "heyitsanmolj.plugins.flutter" },
	{ import = "heyitsanmolj.plugins.misc" },
	{ import = "heyitsanmolj.plugins.snippets" },
	{ import = "heyitsanmolj.plugins.ui" },
	{ import = "heyitsanmolj.plugins.ux" },
	{ import = "heyitsanmolj.plugins.db" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
