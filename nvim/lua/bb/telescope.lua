local telescope = require('telescope')
local actions = require('telescope.actions')
-- local previewers = require('telescope.previewers')
-- local pickers = require('telescope.pickers')
-- local sorters = require('telescope.sorters')
-- local finders = require('telescope.finders')


telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = 'λ ',
    selection_caret = "➤ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<c-u>'] = false, -- inoremap'd to clear line
        ['<c-a>'] = false, -- inoremap'd to move to start of line
        ['<c-e>'] = false, -- inoremap'd to move to end of line
        ['<c-w>'] = false, -- inoremap'd to delete previous word
    },
  },
  winblend = 10,
  selection_strategy = "reset",
  -- sorting_strategy = "descending",
  sorting_strategy = "ascending",
  layout_strategy = "bottom_pane",
  -- layout_strategy = "vertical",
  layout_config = {
    horizontal = {
      mirror = false,
    },
    vertical = {
      mirror = false,
    },
  },
  -- border = true,
  -- borderchars = {
    --   "z",
    --   prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
    --   results = { " " },
    --   -- results = { "a", "b", "c", "d", "e", "f", "g", "h" },
    --   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
  -- },
  -- border = {},
  -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  color_devicons = true,
  use_less = true,
  path_display = {},
  set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
  grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
  qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
