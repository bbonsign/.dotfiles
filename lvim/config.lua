--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "debug"
lvim.lsp.diagnostics.virtual_text = false
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["]e"] = ":lua  vim.diagnostic.goto_next()<cr>"
lvim.keys.normal_mode["[e"] = ":lua  vim.diagnostic.goto_prev()<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<leader>f")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

lvim.builtin.telescope.defaults.path_display = { "truncate" }
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings[","] = { "<cmd>Telescope buffers<CR>", "Buffers" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["f"] = {
  name = "+Files",
  ["f"] = { "<cmd>Telescope find_files<CR>", "Write file" },
  ["w"] = { "<cmd>w<CR>", "Write file" },
  ["s"] = { "<cmd>w<CR>", "Write file" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "Toggle" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["w"] = {
  name = "+window",
  ["="] = { '<C-w>=', 'balance splits' },
  c = { '<C-w>c', 'close window' },
  H = { '<C-w>H', 'move left' },
  h = { '<C-w>h', 'change left' },
  J = { '<C-w>J', 'move down' },
  j = { '<C-w>j', 'change down' },
  K = { '<C-w>K', 'move up' },
  k = { '<C-w>k', 'change up' },
  L = { '<C-w>L', 'move right' },
  l = { '<C-w>l', 'change right' },
  m = { ':MaximizerToggle!<CR>', 'maximizer toggle' },
  o = { '<C-w>o', 'only window' },
  q = { '<C-w>c', 'close window' },
  R = { '<C-w>R', 'rotate windows <-' },
  r = { '<C-w>r', 'rotate windows ->' },
  s = { ':split<CR>', 'horizontal split' },
  t = { ':tab split<CR>', 'new tab w/ current buf' },
  v = { ':vsplit<CR>', 'veritcal split' },
  W = { '<C-w>W', 'other window <-' },
  w = { '<C-w>w', 'other window ->' },
  z = { ':MaximizerToggle!<CR>', 'maximizer toggle' }
}
-- local function map(mode, lhs, rhs, opts)
--   opts = vim.tbl_extend('force', { noremap = true, silent = true },
--     opts or {})
--   vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
-- end

-- -- Navigation
-- map('n', ']g', "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'",
--   { expr = true })
-- map('n', '[g', "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'",
--   { expr = true })
-- map('n', ']h', "&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'",
--   { expr = true })
-- map('n', '[h', "&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'",
--   { expr = true })
-- -- Text object
-- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
-- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')

lvim.builtin.which_key.mappings["h"] = {
  s = { '<cmd>Gitsigns stage_hunk<CR>', "desc" },
  r = { '<cmd>Gitsigns reset_hunk<CR>', "desc" },
  S = { '<cmd>Gitsigns stage_buffer<CR>', "desc" },
  u = { '<cmd>Gitsigns undo_stage_hunk<CR>', "desc" },
  R = { '<cmd>Gitsigns reset_buffer<CR>', "desc" },
  p = { '<cmd>Gitsigns preview_hunk<CR>', "desc" },
  B = { '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', "desc" },
  b = { '<cmd>Gitsigns toggle_current_line_blame<CR>', "desc" },
  d = { '<cmd>Gitsigns diffthis<CR>', "desc" },
  D = { '<cmd>lua require"gitsigns".diffthis("~")<CR>', "desc" },

  -- Text object
  -- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  -- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "elixir",
  "erlang",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.bufferline.active = false
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.transparent_window = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", args = { "--profile", "black" }, filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

-- Additional Plugins
lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("bb.zen").config()
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("bb.dial").config()
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "<leader>j.", ":HopWordCurrentLine<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jf", ":HopChar1CurrentLine<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jb", ":HopWordBC<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jw", ":HopWordAC<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jj", ":HopLineStartAC<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jk", ":HopLineStartBC<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>j/", ":HopPattern<cr>", {})
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  -- {
  --   "karb94/neoscroll.nvim",
  --   event = "WinScrolled",
  --   config = function()
  --     require('neoscroll').setup({
  --       -- All these keys will be mapped to their corresponding default scrolling animation
  --       mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
  --       hide_cursor = true, -- Hide cursor while scrolling
  --       stop_eof = true, -- Stop at <EOF> when scrolling downwards
  --       use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  --       respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --       easing_function = nil, -- Default easing function
  --       pre_hook = nil, -- Function to run before the scrolling animation starts
  --       post_hook = nil, -- Function to run after the scrolling animation ends
  --     })
  --   end
  -- },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

require("bb.options").setup()
require("bb.mappings").setup()
