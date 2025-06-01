return {
	"andymass/vim-matchup",
	event = "BufReadPost",
	config = function()
		vim.g.matchup_matchparen_offscreen = {}
		vim.g.matchup_matchparen_enabled = 0 -- Disable matchparen to avoid conflicts
	end,
}
