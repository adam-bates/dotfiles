
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap=true, silent=true }

local lsp_mappings = function(client, bufnr)
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gb", "<c-t>", bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", bufopts)

    vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

require('lspconfig').tsserver.setup({
    on_attach = lsp_mappings,
    capabilities = capabilities,
})

require('lspconfig').rust_analyzer.setup({
    on_attach = lsp_mappings,
    capabilities = capabilities,
})

vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

