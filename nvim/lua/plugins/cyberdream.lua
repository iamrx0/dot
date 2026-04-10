require("cyberdream").setup({
    transparent = true,
    borderless_pickers = false,
    italic_comments = true,
    hide_fillchars = true,
    terminal_colors = true,
    variant = "default",
})
vim.cmd.colorscheme('cyberdream')
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white" })
