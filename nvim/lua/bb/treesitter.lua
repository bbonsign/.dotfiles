require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"}, -- haskell is causing big error screen on start up b/c of :TSUpdate
    highlight = {
        enable = true -- false will disable the whole extension
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "+",
            node_decremental = "-",
            scope_incremental = "grc"
        }
    },

    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },

    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [','] = 'textsubjects-container-outer'
        }
    },

    autotag = {
        enable = true,
        filetypes = {
            "html", "xml", "vue", "jinja2", "eelixir", "javascript",
            "javascriptreact", "typescriptreact", "htmldjango"
        }
    }
}
