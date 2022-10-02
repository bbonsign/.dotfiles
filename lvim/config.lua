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

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Adds s/tab keybinds for cmp-cmdline, : and /
-- lvim.builtin.cmp.mapping["<Tab>"]["c"] = lvim.builtin.cmp.mapping["<Tab>"]["i"]
-- lvim.builtin.cmp.mapping["<S-Tab>"]["c"] = lvim.builtin.cmp.mapping["<S-Tab>"]["i"]
-- lvim.builtin.cmp.mapping["<Down>"]["c"] = lvim.builtin.cmp.mapping["<Tab>"]["i"]
-- lvim.builtin.cmp.mapping["<Up>"]["c"] = lvim.builtin.cmp.mapping["<S-Tab>"]["i"]
-- lvim.builtin.cmp.mapping["<C-y>"]["c"] = lvim.builtin.cmp.mapping["<C-y>"]["i"]
-- lvim.keys.command_mode["<C-Space>"] = lvim.builtin.cmp.mapping["<C-Space>"]
-- lvim.keys.command_mode["<C-Space>"] = lvim.builtin.cmp.mapping["<C-Space>"]
-- lvim.keys.command_mode["<C-j>"] = lvim.builtin.cmp.mapping["<C-j>"]
-- lvim.keys.command_mode["<C-k>"] = lvim.builtin.cmp.mapping["<C-k>"]
-- lvim.keys.insert_mode["<A-s>"] = lvim.builtin.cmp.mapping["<C-k>"]

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
lvim.builtin.treesitter.rainbow.enable = true
-- lvim.builtin.treesitter.rainbow.colors = {
--   "#a9047d",
--   "#a89984",
--   "#b16286",
--   "#d79921",
--   "#d79921",
--   "#689d6a",
--   "#d65d0e",
--   "#458588",
-- }
-- lvim.builtin.treesitter.rainbow.termcolors = {
--   "Green",
--   "Yellow",
--   "Green",
--   "Blue",
--   "Magenta",
--   "Cyan",
--   "White",
-- }

lvim.builtin.bufferline.active = false
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "file_browser")
  pcall(telescope.load_extension, "ui-select")
  pcall(telescope.load_extension, "neoclip")
end

lvim.transparent_window = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.term_mode["<ESC>"] = "<C-\\><C-n>"
lvim.keys.normal_mode["]e"] = ":lua vim.diagnostic.goto_next()<cr>"
lvim.keys.normal_mode["[e"] = ":lua vim.diagnostic.goto_prev()<cr>"
lvim.keys.normal_mode["]g"] = ":Gitsigns next_hunk<cr>"
lvim.keys.normal_mode["[g"] = ":Gitsigns prev_hunk<cr>"
lvim.keys.normal_mode["zf"] = "z="
-- unmap a default keymapping
-- vim.keymap.del("n", "<leader>f")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.globalstatus = true

lvim.builtin.project.manual_mode = true

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
lvim.builtin.which_key.mappings[" "] = { "<cmd>Telescope git_files<CR>", "Git Files" }
lvim.builtin.which_key.mappings["'"] = { "<cmd>Telescope resume<CR>", "Resume" }
lvim.builtin.which_key.mappings["."] = { "<cmd>Telescope find_files<CR>", "Buffers" }
lvim.builtin.which_key.mappings[","] = { "<cmd>Telescope buffers<CR>", "Buffers" }
lvim.builtin.which_key.mappings[":"] = { "<cmd>Telescope commands<CR>", "Commands" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope<CR>", "Telescope" }
lvim.builtin.which_key.mappings["y"] = { ":lua require('telescope').extensions.neoclip.default()", "neoclip" }
lvim.builtin.which_key.mappings["m"] = {
  ":<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><c-f><left>",
  "edit macro"
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["s"]["s"] = { "<cmd>Telescope<CR>", "Telescope" }
lvim.builtin.which_key.mappings["s"]["b"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "FzyBuffer" }
lvim.builtin.which_key.mappings["s"]["c"] = { "<cmd>Telescope commands<CR>", "Commands" }
lvim.builtin.which_key.mappings["s"]["C"] = { "<cmd>Telescope colorschemes<CR>", "Colorschemes" }

lvim.builtin.which_key.mappings["l"]["s"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" }

lvim.builtin.which_key.mappings["<tab>"] = {
  name = "tabs",
  ["]"] = { "<cmd>tabnext<CR>", "Next" },
  ["["] = { "<cmd>tabprevious<CR>", "Previous" },
  ["<tab>"] = { ':tab split<CR>', 'new tab w/ current buf' },
  c = { "<cmd>tabclose<CR>", "Close" },
  d = { "<cmd>tabclose<CR>", "Close" },
  f = { "<cmd>tabfirst<CR>", "First" },
  l = { "<cmd>tablast<CR>", "Last" },
  n = { "<cmd>tabnext<CR>", "Next" },
  p = { "<cmd>tabprevious<CR>", "Prev" },
  t = { ':tab split<CR>', 'new tab w/ current buf' }
}
lvim.builtin.which_key.mappings["a"] = {
  name = '+actions',
  [':'] = { 'A;<Esc>', 'append ;' },
  a = { 'A_<Esc>r', 'append char to line' },
  C = { ':ColorizerToggle<CR>', 'toggle colorizer' },
  c = { ':set cursorline!<CR>', 'toggle line hi-light' },
  n = { ':set nonumber!<CR>', 'line-numbers' },
  r = { ':set norelativenumber!<CR>', 'relative line nums' },
  S = { ':let @/ = ""<CR>', 'remove search highlight' },
  s = { ':setlocal spell!<CR>', 'toggle spelling in buffer' },
  t = { ':FloatermToggle<CR>', 'terminal' },
  v = { ':SymbolsOutline<CR>', 'tag viewer' },
  -- v = { ':Vista!!<CR>', 'tag viewer' },
  -- v = {':TagbarToggle<CR>', 'tag viewer'},
  w = { ':set wrap!<CR>', 'toggle wrap' },
}
lvim.builtin.which_key.mappings["b"] = {
  name = '+buffer',
  b = { ':Telescope buffers<CR>', 'fzf-buffer' },
  D = { ':BufDel!<CR>', 'delete-buffer, ignore changes' },
  d = { ':BufDel<CR>', 'delete-buffer' },
  f = { ':bfirst<CR>', 'first-buffer' },
  k = { ':BufDel<CR>', 'delete-buffer' },
  l = { ':blast<CR>', 'last-buffer' },
  n = { ':bnext<CR>', 'next-buffer' },
  p = { ':bprevious<CR>', 'previous-buffer' }
}

lvim.builtin.which_key.mappings["f"] = {
  name = "+Files",
  f = { "<cmd>Telescope find_files<CR>", "Files" },
  b = { "<cmd>Telescope file_browser<CR>", "File Browser" },
  w = { "<cmd>w<CR>", "Write file" },
  R = { ":earlier 1f<CR>", "revert to last write" },
  s = { "<cmd>w<CR>", "Write file" },
}
lvim.builtin.which_key.mappings["n"] = {
  name = "notify",
  c = { "<cmd>lua require('notify').dismiss()<CR>", "dismiss" },
  d = { "<cmd>lua require('notify').dismiss()<CR>", "dismiss" },
  n = { "<cmd>lua require('notify').dismiss()<CR>", "dismiss" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Term",
  l = { ":ToggleTermSendCurrentLine<CR>", "Send line" },
  v = { ":ToggleTermSendVisualLines<CR>", "Send lines", mode = "v" },
  t = { ":ToggleTerm<CR>", "ToggleTerm" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["x"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "Toggle" },
  x = { "<cmd>TroubleToggle<cr>", "Toggle" },
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
  { "wsdjeg/vim-fetch" },
  { "tpope/vim-unimpaired" },
  -- { "tpope/vim-vinegar",
  --   event = "BufRead",
  -- },
  { "tpope/vim-surround",
    event = "BufRead",
  },
  { "tpope/vim-repeat",
    event = "BufRead",
  },
  { "wellle/targets.vim",
    event = "BufRead",
  },
  { "AndrewRadev/sideways.vim",
    event = "BufRead",
  },

  { "nvim-telescope/telescope-file-browser.nvim" },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  { "whatyouhide/vim-textobj-xmlattr",
    event = "BufRead",
    requires = "kana/vim-textobj-user"
  },
  { "jceb/vim-textobj-uri",
    event = "BufRead",
    requires = "kana/vim-textobj-user"
  },
  { "Julian/vim-textobj-variable-segment",
    event = "BufRead",
    requires = "kana/vim-textobj-user"
  },
  { "mbbill/undotree" },
  { "ojroques/nvim-bufdel",
    event = "BufRead",
  },
  { "haya14busa/vim-asterisk",
    event = "BufRead",
    config = function()
      vim.cmd [[
        map *  <Plug>(asterisk-z*)
        map #  <Plug>(asterisk-z#)
        map g* <Plug>(asterisk-gz*)
        map g# <Plug>(asterisk-gz#)
        let g:asterisk#keeppos = 1
       ]]
    end
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd      = "TroubleToggle",
    requires = "folke/lsp-colors.nvim"
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("bb.zen").config()
    end,
  },
  {
    "folke/twilight.nvim",
    cmd = {
      "Twilight",
      "TwilightEnable",
      "TwilightDisable",
    },
    config = function()
      require("twilight").setup {
        dimming = { alpha = 0.9 }
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("bb.dial").config()
    end,
  },

  -- {
  --   "hrsh7th/cmp-cmdline",
  --   event = "BufRead",
  --   config = function()
  --     require 'cmp'.setup.cmdline(':', {
  --       sources = {
  --         { name = 'cmdline' }
  --       }
  --     })
  --     require 'cmp'.setup.cmdline('/', {
  --       sources = {
  --         { name = 'buffer' }
  --       }
  --     })
  --   end
  -- },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "<leader>j.", ":HopWordCurrentLine<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jf", ":HopChar1<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>jF", ":HopChar1CurrentLineBC<cr>", {})
      vim.api.nvim_set_keymap("n", "<leader>JF", ":HopChar1CurrentLineBC<cr>", {})
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
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("gitlinker").setup {
        opts = {
          -- remote = 'github', -- force the use of a specific remote
          -- adds current line nr in the url for normal mode
          add_current_line_on_normal_mode = true,
          -- callback for what to do with the url
          action_callback = require("gitlinker.actions").copy_to_clipboard,
          -- print the url after performing the action
          print_url = false,
          -- mapping to call url generation
          mappings = "<leader>gy",
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      vim.cmd [[
        let g:VM_theme = 'nord'

        let g:VM_maps = {}
        let g:VM_maps['Add Cursor Down'] = '<C-j>'
        let g:VM_maps['Add Cursor Up'] = '<C-k>'

        let g:VM_mouse_mappings = 1

        let g:VM_Mono_hl   = 'DiffChange'
        let g:VM_Extend_hl = 'DiffAdd'
        let g:VM_Cursor_hl = 'Visual'
        let g:VM_Insert_hl = 'DiffChange'

        let g:VM_highlight_matches = 'underline'
      ]]
    end,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    config = function()
      require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup(
        {
          history = 1000,
          enable_persistent_history = true,
          length_limit = 1048576,
          continuous_sync = false,
          db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
          filter = nil,
          preview = true,
          default_register = '"',
          default_register_macros = 'q',
          enable_macro_history = true,
          content_spec_column = false,
          on_paste = {
            set_reg = false,
          },
          on_replay = {
            set_reg = false,
          },
          keys = {
            telescope = {
              i = {
                select = '<cr>',
                paste = '<c-.>',
                paste_behind = '<c-,>',
                replay = '<c-q>', -- replay a macro
                delete = '<c-d>', -- delete an entry
                custom = {},
              },
              n = {
                select = '<cr>',
                paste = 'p',
                --- It is possible to map to more than one key.
                -- paste = { 'p', '<c-p>' },
                paste_behind = 'P',
                replay = 'q',
                delete = 'd',
                custom = {},
              },
            },
            fzf = {
              select = 'default',
              -- paste = 'ctrl-p',
              -- paste_behind = 'ctrl-k',
              custom = {},
            },
          },
        }
      )
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function()
      require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
    end
  },
  -- { 'ggandor/leap.nvim',
  --   config = function()
  --     require('leap').set_default_keymaps()
  --   end
  -- }

  -- Smooth scrolling plugins:
  -- {
  --   'declancm/cinnamon.nvim',
  --   config = function() require('cinnamon').setup() end
  -- },
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
