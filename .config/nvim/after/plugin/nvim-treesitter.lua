require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "css", "html", "http", "java", "javascript", "jsdoc", "json", "lua", "php", "python", "rust", "sql", "svelte", "typescript", "yaml" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

