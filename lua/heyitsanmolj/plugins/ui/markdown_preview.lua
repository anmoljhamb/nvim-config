return {
	"ellisonleao/glow.nvim",
	config = function()
		require("glow").setup({
			width = 120, -- Adjust width as needed
			height = 80, -- Adjust height as needed
		})
	end,
}

--
-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
-- 	build = "cd app && yarn install",
-- 	init = function()
-- 		vim.g.mkdp_filetypes = { "markdown" }
-- 	end,
-- 	ft = { "markdown" },
-- }
