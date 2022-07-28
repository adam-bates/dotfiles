
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

-- 0 = off, 1 = end of line, 2 = lsp_lines
-- start on 1 by default
vim.g.diagnostics_state = 1
vim.g.diagnostics_active = true

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

function _G.cycle_diagnostics()
    if vim.g.diagnostics_state == 0 then
        vim.g.diagnostics_state = 1
        vim.g.diagnostics_active = true

        vim.diagnostic.hide()
        vim.diagnostic.disable()

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        }
        )

        vim.diagnostic.config({ virtual_lines = false, virtual_text = true })

        vim.diagnostic.enable()
        vim.diagnostic.show()

    elseif vim.g.diagnostics_state == 1 then
        vim.g.diagnostics_state = 2
        vim.g.diagnostics_active = false

        vim.diagnostic.hide()
        vim.diagnostic.disable()

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
        }
        )

        vim.diagnostic.config({ virtual_lines = true, virtual_text = false })

        vim.diagnostic.enable()
        vim.diagnostic.show()
    else
        vim.g.diagnostics_state = 0
        vim.g.diagnostics_active = false

        vim.diagnostic.hide()
        vim.diagnostic.disable()

        vim.diagnostic.config({ virtual_lines = false, virtual_text = false })

        vim.diagnostic.enable()
        vim.diagnostic.show()
    end
end

vim.api.nvim_set_keymap("n", "<leader>l", ':call v:lua.cycle_diagnostics()<CR>',  { noremap = true, silent = true })

