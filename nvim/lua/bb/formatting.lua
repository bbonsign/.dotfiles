-- Formatting
-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

local prettierFmt = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--plugin-search-dir=."},
        stdin = true
    }
end

require('formatter').setup({
    logging = false,
    filetype = {
        css = {prettierFmt},
        html = {prettierFmt},
        javascript = {prettierFmt},
        javascriptreact = {prettierFmt},
        json = {prettierFmt},
        less = {prettierFmt},
        markdown = {prettierFmt},
        svelte = {prettierFmt},
        typescript = {prettierFmt},
        typescriptreact = {prettierFmt},
        vue = {prettierFmt},
        yaml = {prettierFmt},
        elixir = {
            function()
                return {exe = "mix", args = {"format"}, stdin = false}
            end
        },
        python = {
            function()
                return {exe = "black", args = {}, stdin = false}
            end
        },
        rust = {
            -- Rustfmt
            function()
                return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
            end
        },
        lua = {
            function()
                return {
                    exe = "lua-format",
                    -- args = {"--count", 2, "--stdin"},
                    stdin = true
                }
            end
        }
    }
})
