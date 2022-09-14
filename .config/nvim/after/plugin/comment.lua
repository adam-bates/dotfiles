local api = require('Comment.api')

vim.keymap.set("n", "<leader>/", api.toggle.linewise.current)
vim.keymap.set("n", "<leader>?", api.toggle.blockwise.current)

local esc = vim.api.nvim_replace_termcodes(
    "<ESC>", true, false, true
)

vim.keymap.set("x", "<leader>/", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode())
end)

vim.keymap.set("x", "<leader>?", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.blockwise(vim.fn.visualmode())
end)

