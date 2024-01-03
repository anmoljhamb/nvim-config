function setScheme(color)
    color = color or "desert"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(50, "Normal", { bg = "None" })
    vim.api.nvim_set_hl(50, "NormalFloat", { bg = "None" })
end

setScheme("github_dark")
