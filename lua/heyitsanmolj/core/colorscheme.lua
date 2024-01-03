function setScheme(color)
    color = color or "desert"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(10, "Normal", { bg = "None" })
    vim.api.nvim_set_hl(10, "NormalFloat", { bg = "None" })
end
