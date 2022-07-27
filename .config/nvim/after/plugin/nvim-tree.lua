require("nvim-tree").setup({
    open_on_setup = true,
    open_on_tab = false,
    hijack_cursor = true,
    view = {
        number = true,
        relativenumber = true,
        side = "left",
        adaptive_size = true,
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "*",
    },
    filters = {
        exclude = { ".git", "node_modules" },
    },
})

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader><CR>", api.node.open.tab)


