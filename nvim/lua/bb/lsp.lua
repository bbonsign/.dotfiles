-- Complettion
-- Set completeopt to have a better completion experience
-- vim.o.completeopt="menuone,noinsert"
-- vim.g.coq_settings = { auto_start = 'shut-up' }
-- require('coq')
-- Setup nvim-cmp.
local cmp = require('cmp')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                          mode, true)
end

local tab_handler = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
    elseif has_words_before() then
        cmp.complete()
    else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
end
local shift_tab_handler = function()
    if cmp.visible() then
        cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
    end
end

local lspkind = require("lspkind")
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    },
    mapping = {
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<Tab>'] = cmp.mapping(tab_handler),
        ['<S-Tab>'] = cmp.mapping(shift_tab_handler),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = {
        {name = "nvim_lua"}, {name = "nvim_lsp"},
        {name = "vsnip"},
        -- {name = "vim-dadbod-completion"}, {name = "spell", keyword_length = 7},
        {
            name = "buffer",
            options = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        }, {name = "path"}, {name = "emoji"}
    },
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s",
                                          lspkind.presets.default[vim_item.kind],
                                          vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = " ",
                nvim_lua = "",
                treesitter = "",
                path = "ﱮ",
                buffer = "﬘",
                zsh = "",
                vsnip = "",
                spell = "暈",
                conjure = " "
            })[entry.source.name]

            return vim_item
        end
    }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Set up for williamboman/nvim-lsp-installer
local on_attach = function(client, bufnr)
    -- require("lsp_signature").on_attach() -- Note: add in lsp client on-attach
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Turn off virtual text for diagnostics; use ]e/[e instead
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false
        })
end

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {on_attach = on_attach, update_capabilities = capabilities}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tailwindcss" then
    --     local _on_attach = opts.on_attach
    --     opts.on_attach = function(client, bufnr)
    --         _on_attach(client, bufnr)
    --         require'.tailwindcss_colorizer'.on_attach(bufnr)
    --     end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
