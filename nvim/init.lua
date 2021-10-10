vim.cmd('source ~/.config/nvim/old_init.vim')

require('bb')
require('settings')
require('debug')

-- Example config in Lua
vim.g.tokyonight_style = "storm" -- Options: "night", "storm", or "day"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Highlight colors in css etc
require'colorizer'.setup(nil, {css = true})

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

vim.g.indent_blankline_char = "" -- No indent guides

require('lsp_signature')

-- Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
  autocmd!
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au TermOpen * set norelativenumber
  au TermOpen * set nonumber
augroup end
]], false)

vim.g.indent_blankline_char = ""

-- LSP settings

local on_attach = function(client, bufnr)
    require("lsp_signature").on_attach() -- Note: add in lsp client on-attach
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
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', [[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Set up for kabouzeid/nvim-lspinstall
local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup {on_attach = on_attach}
    end
end

setup_servers()

-- require'lspconfig'.efm.setup({
--   filetypes = {"elixir"}
-- })

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Enable the following language servers
-- local servers = { 'rust_analyzer', 'pyright', 'tsserver', 'lua' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- Set completeopt to have a better completion experience
-- vim.o.completeopt="menuone,noinsert"

-- Compe setup
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'disable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {path = true, nvim_lsp = true, nvim_lua = true, spell = true}
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- lspsaga
require('lspsaga').init_lsp_saga({
    max_preview_lines = 20,
    code_action_icon = '',
    code_action_keys = {quit = {'q', '<C-c>', '<Esc>'}},
    rename_action_keys = {quit = {'<C-c>', '<Esc>'}},
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = {'q', '<C-c>', '<Esc>'},
        scroll_down = '<C-f>',
        scroll_up = '<C-b>'
    },
    border_style = "double"
})
vim.api.nvim_exec([[
  nnoremap <silent> gh :Lspsaga lsp_finder<CR>
 " nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
  vnoremap <silent> <leader>ca :<C-U>Lspsaga range_code_action<CR>
  nnoremap <silent> K :Lspsaga hover_doc<CR>
  nnoremap <silent> <leader>lp :Lspsaga preview_definition<CR>
  nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
  nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
  nnoremap <silent> gs :Lspsaga signature_help<CR>
  nnoremap <silent> gR <cmd>lua require('lspsaga.rename').rename()<CR>
  nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
  nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>zz
  nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>zz
  ]], true)

local cfg = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 12, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ", -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = true, -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
        border = "shadow" -- double, single, shadow, none
    },
    extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    -- deprecate !!
    -- decorator = {"`", "`"}  -- this is no longer needed as nvim give me a handler and it allow me to highlight active parameter in floating_window
}

require'lsp_signature'.on_attach(cfg)

local prettierFmt = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

-- Formatting
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
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>Format<CR>',
                        {noremap = true, silent = true})

