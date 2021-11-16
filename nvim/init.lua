vim.cmd('source ~/.config/nvim/old_init.vim')

require('bb')
require('settings')
require('debug')

-- Colorscheme
-- vim.g.tokyonight_style = "storm" -- Options: "night", "storm", or "day"
-- vim.g.tokyonight_italic_functions = false
-- vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
-- vim.cmd [[colorscheme tokyonight]]
require('github-theme').setup({
    theme_style="dimmed",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#990000"}
  })

-- Highlight colors in css etc
require'colorizer'.setup(nil, {css = true})

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

