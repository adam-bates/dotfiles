local api = require("nvim-tree.api")

local on_attach = function(bufnr)
    local opts = { buffer = bufnr, noremap = true }

    vim.keymap.set("n", "<leader><CR>", api.node.open.tab, opts)
    vim.keymap.set("n", "<leader><Left>", api.node.open.vertical, opts)
    vim.keymap.set("n", "<leader><Up>", api.node.open.horizontal, opts)
    vim.keymap.set("n", "=", api.tree.change_root_to_node, opts)
end

require("nvim-tree").setup({
    on_attach = on_attach,

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
    git = {
        ignore = false,
    },
    filters = {
        dotfiles = false,
        exclude = { ".git", "node_modules" },
    },
})

