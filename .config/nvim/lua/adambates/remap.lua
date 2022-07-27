local nnoremap = require("adambates.keymap").nnoremap

nnoremap("<leader>w", "<cmd>w<CR>")
nnoremap("<leader>q", "<cmd>q<CR>")

nnoremap("<leader>p", "<c-w><c-p>")

nnoremap("<leader>e", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>E", "<cmd>NvimTreeToggle<CR>")

nnoremap("<leader>j", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>h", "<cmd>Telescope help_tags<CR>")

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

nnoremap("<leader>c", "<c-w>c")
nnoremap("<leader>C", "<cmd>tabclose<CR>")

