return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local local_theme = require("lualine.themes.nightfly")
        require("lualine").setup({
            opts = {
                theme = local_theme
            }
        })
    end
}
