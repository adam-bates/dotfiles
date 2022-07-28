local api = require("nvim-tree.api")

require("nvim-tree").setup({
    open_on_setup = true,
    open_on_tab = false,
    hijack_cursor = true,
    view = {
        number = true,
        relativenumber = true,
        side = "left",
        adaptive_size = true,
        mappings = {
            list = {
                { key = "<leader><CR>", action = api.node.open.tab },
                { key = "<leader><Left>", action = api.node.open.vertical },
                { key = "<leader><Right>", action = api.node.open.horizontal },
            },
        },
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "*",
    },
    filters = {
        exclude = { ".git", "node_modules" },
    },
})

