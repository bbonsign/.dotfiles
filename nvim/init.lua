vim.cmd('source ~/.config/nvim/old_init.vim')

require('bb')
-- require('debug')

-- Colorscheme
vim.g.tokyonight_style = "storm" -- Options: "night", "storm", or "day"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]
-- require('github-theme').setup({
--     theme_style="dimmed",
--     sidebars = {"qf", "vista_kind", "terminal", "packer"},
--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   colors = {hint = "orange", error = "#990000"}
--   })

-- Highlight colors in css etc
require'colorizer'.setup(nil, {css = true})

require('trouble').setup()

vim.g.indent_blankline_char = "" -- No indent guides

-- Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
  autocmd!
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au TermOpen * set norelativenumber
  au TermOpen * set nonumber
augroup end
]], false)

require('gitsigns').setup {
    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true},
                                  opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']g', "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'",
            {expr = true})
        map('n', '[g', "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'",
            {expr = true})
        map('n', ']h', "&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'",
            {expr = true})
        map('n', '[h', "&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'",
            {expr = true})

        -- Actions
        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
        map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb',
            '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
        map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
        map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
        map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

        -- Text object
        map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

require'fzf-lua'.setup {
    winopts = {
        height = 0.90, -- window height
        width = 0.95, -- window width
    }
}

 require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
