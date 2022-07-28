require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<leader><CR>"] = "select_tab",
                ["<leader><Left>"] = "select_vertical",
                ["<leader><Up>"] = "select_horizontal",
            },
            n = {
                ["<leader><CR>"] = "select_tab",
                ["<leader><Left>"] = "select_vertical",
                ["<leader><Up>"] = "select_horizontal",
            },
        },
    },
})

