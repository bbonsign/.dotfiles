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

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                [[<cmd>lua vim.lsp.buf.implementation()<CR>]],
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr',
                                [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la',
                                [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e',
                                '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e',
                                '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                                opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', [[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Complettion
-- Set completeopt to have a better completion experience
-- vim.o.completeopt="menuone,noinsert"

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
        {name = "nvim_lua"}, {name = "nvim_lsp"}, {name = "vsnip"},
        -- {name = "vim-dadbod-completion"}, {name = "spell", keyword_length = 7},
        {
            name = "buffer",
            opts = {get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end}
        }, {name = "emoji"}, {name = "path"}
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
                nvim_lsp = "ﲳ",
                nvim_lua = "",
                treesitter = "",
                path = "ﱮ",
                buffer = "﬘",
                zsh = "",
                vsnip = "",
                spell = "暈"
            })[entry.source.name]

            return vim_item
        end
    }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
-- })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

-- Set up for kabouzeid/nvim-lspinstall
local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
    end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
setup_servers()
