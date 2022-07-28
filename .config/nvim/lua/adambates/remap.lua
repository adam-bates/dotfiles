local keymap = require("adambates.keymap")

local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local xnoremap = keymap.xnoremap
local inoremap = keymap.inoremap

nnoremap("<leader>w", "<cmd>w<CR>")
nnoremap("<leader>q", "<cmd>q<CR>")

nnoremap("<leader>p", "<c-w>w")
nnoremap("<leader><Up>", "<c-w><Up>")
nnoremap("<leader><Down>", "<c-w><Down>")
nnoremap("<leader><Left>", "<c-w><Left>")
nnoremap("<leader><Right>", "<c-w><Right>")
nnoremap("<leader>c", "<c-w>c")

nnoremap("<leader>1", "1gt")
nnoremap("<leader>2", "2gt")
nnoremap("<leader>3", "3gt")
nnoremap("<leader>4", "4gt")
nnoremap("<leader>5", "5gt")
nnoremap("<leader>6", "6gt")
nnoremap("<leader>7", "7gt")
nnoremap("<leader>8", "8gt")
nnoremap("<leader>9", "9gt")

nnoremap("<leader>]", "gt")
nnoremap("<leader>[", "gT")

nnoremap("<leader>}", "<cmd>tabm +1<CR>")
nnoremap("<leader>{", "<cmd>tabm -1<CR>")

nnoremap("<leader>C", "<cmd>tabclose<CR>")

nnoremap("<leader>e", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>E", "<cmd>NvimTreeToggle<CR>")

nnoremap("<leader>j", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>h", "<cmd>Telescope help_tags<CR>")

nnoremap("<leader>/", '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
nnoremap("<leader>?", '<CMD>lua require("Comment.api").toggle_current_blockwise()<CR>')

vnoremap("<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
vnoremap("<leader>?", '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')

xnoremap("<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
xnoremap("<leader>?", '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')

