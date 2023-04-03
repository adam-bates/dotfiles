vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"

require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
})
vim.cmd("colorscheme tokyonight")

