local wk = require("which-key")

-- Extract easymotion prefixes to share with e and j
local easymotion_maps = {
    alt = {
        name = '+Easymotion',
        ['}'] = {'<Plug>(easymotion-next)', 'next'},
        ['{'] = {'<Plug>(easymotion-previous)', 'previous'},
        E = {'<Plug>(easymotion-ge)', 'end of word above'},
        F = {'<Plug>(easymotion-bd-f)', 'bidir-f'},
        J = {'<Plug>(easymotion-eol-j)', 'eol-j'},
        K = {'<Plug>(easymotion-eol-k)', 'eol-k'},
        L = {'<Plug>(easymotion-bd-jk)', 'lines'},
        N = {'<Plug>(easymotion-N)', 'N'},
        W = {'<Plug>(easymotion-overwin-w)', 'overwin word'}
    },

    main = {
        name = '+easymotion',
        ['.'] = {'<Plug>(easymotion-repeat)', 'repeat'},
        [']'] = {'<Plug>(easymotion-next)', 'next'},
        ['['] = {'<Plug>(easymotion-previous)', 'previous'},
        b = {'<Plug>(easymotion-b)', 'word, above '},
        E = {'<Plug>(easymotion-ge)', 'end of word above'},
        e = {'<Plug>(easymotion-e)', 'end of word'},
        F = {'<Plug>(easymotion-bd-f)', 'bidir-f'},
        f = {'<Plug>(easymotion-f)', 'f'},
        h = {'<Plug>(easymotion-linebackward)', 'line back'},
        J = {'<Plug>(easymotion-eol-j)', 'eol-j'},
        j = {'<Plug>(easymotion-j)', 'lines up'},
        K = {'<Plug>(easymotion-eol-k)', 'eol-k'},
        k = {'<Plug>(easymotion-k)', 'line motion'},
        L = {'<Plug>(easymotion-bd-jk)', 'lines'},
        l = {'<Plug>(easymotion-lineforward)', 'line forward'},
        N = {'<Plug>(easymotion-N)', 'N'},
        n = {'<Plug>(easymotion-n)', 'n'},
        s = {'<Plug>(easymotion-sn)', 'sn'},
        t = {'<Plug>(easymotion-t)', 't'},
        w = {'<Plug>(easymotion-w)', 'word, below'}
    }
}

-- non-prefixed leader maps
wk.register({s = easymotion_maps.main, S = easymotion_maps.alt}, {prefix = "g"})

-- non-prefixed leader maps
wk.register({
    ['!'] = {':.!fish<CR>', 'send line to fish'},
    ["`"] = {"<cmd>:e #<cr>", "Switch to Other Buffer"},
    [':'] = {':FzfLua command_history<CR>', 'command history'},
    [';'] = {':FzfLua commands<CR>', 'commands'},
    [','] = {':FzfLua buffers<CR>', 'fzf-buffer'},
    -- [','] = {'<cmd>Telescope buffers<CR>', 'buffers'},
    ["/"] = {"<cmd>FzfLua<CR>", "FzfLua"},
    m = {
        ":<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><c-f><left>",
        "edit macro"
    },
    q = {':q<CR>', 'quit'},
    X = {':norm ciw <CR>', 'trim to one space between words'},
}, {prefix = "<leader>"})

-- prefixed leader keymaps
wk.register({
    ['.'] = {
        name = '+home',
        ['.'] = {':e $MYVIMRC<CR>', 'open init'},
        l = {'<C-U>:luafile %<CR>', 'luafile %'},
        h = {':Dashboard<CR>', 'start screen'},
        r = {':source $MYVIMRC<CR>', 'reload config'},
        s = {':SessionSave<CR>', 'save session'}
    },

    ['<space>'] = {
        name = '+spaces',
        ['.'] = {'o<Esc>kO<Esc>j^', 'lines above/below'},
        ['>'] = {'a<Space><Esc>hi<Space><Esc>l', 'spaces left+right'},
        ['<'] = {'a<Space><Esc>hi<Space><Esc>l', 'spaces left+right'},
        h = {'i<Space><Esc>`]', 'space left'},
        j = {":<c-u>put =repeat(nr2char(10), v:count1)<cr>'[k", 'line below'},
        k = {":<c-u>put! =repeat(nr2char(10), v:count1)<cr>']j", 'line above'},
        l = {'a<Space><Esc>`[h', 'space right'}
    },

    ["<tab>"] = {
        name = "workspace",
        ["]"] = {"<cmd>tabnext<CR>", "Next"},
        ["["] = {"<cmd>tabprevious<CR>", "Previous"},
        ["<tab>"] = {':tab split<CR>', 'new tab w/ current buf'},
        c = {"<cmd>tabclose<CR>", "Close"},
        d = {"<cmd>tabclose<CR>", "Close"},
        f = {"<cmd>tabfirst<CR>", "First"},
        l = {"<cmd>tablast<CR>", "Last"},
        n = {"<cmd>tabnext<CR>", "Next"},
        p = {"<cmd>tabprevious<CR>", "Prev"},
        t = {':tab split<CR>', 'new tab w/ current buf'}
    },

    a = {
        name = '+actions',
        [':'] = {'A;<Esc>', 'append ;'},
        a = {'A_<Esc>r', 'append char to line'},
        C = {':ColorizerToggle<CR>', 'toggle colorizer'},
        c = {':set cursorline!<CR>', 'toggle line hi-light'},
        n = {':set nonumber!<CR>', 'line-numbers'},
        R = {':RooterToggle<CR>', 'toggle rooter'},
        r = {':set norelativenumber!<CR>', 'relative line nums'},
        S = {':let @/ = ""<CR>', 'remove search highlight'},
        s = {':setlocal spell!<CR>', 'toggle spelling in buffer'},
        t = {':FloatermToggle<CR>', 'terminal'},
        v = {':Vista!!<CR>', 'tag viewer'},
        -- v = {':TagbarToggle<CR>', 'tag viewer'},
        w = {':set wrap!<CR>', 'toggle wrap'},
        x = {':StripWhitespace<CR>', 'strip whitespace'},
        X = {':ToggleWhitespace<CR>', 'toggle whitespace'}
    },

    b = {
        name = '+buffer',
        b = {':FzfLua buffers<CR>', 'fzf-buffer'},
        D = {':BufDel!<CR>', 'delete-buffer, ignore changes'},
        d = {':BufDel<CR>', 'delete-buffer'},
        f = {':bfirst<CR>', 'first-buffer'},
        h = {':Dashboard<CR>', 'home-buffer'},
        k = {':BufDel<CR>', 'delete-buffer'},
        l = {':blast<CR>', 'last-buffer'},
        n = {':bnext<CR>', 'next-buffer'},
        p = {':bprevious<CR>', 'previous-buffer'}
    },

    c = {
        name = '+code',
        D = {':FzfLua lsp_workspace_diagnostics<CR>', 'workspace diagnostics'},
        d = {':FzfLua lsp_document_diagnostics<CR>', 'doc diagnostics'},
        f = {':Format<CR>', 'format buffer'},
    },

    E = easymotion_maps.alt,
    e = easymotion_maps.main,
    J = easymotion_maps.alt,
    j = easymotion_maps.main,

    f = {
        name = "+file",
        f = {':FzfLua files<CR>', 'files'},
        R = {':earlier 1f<CR>', 'revert to last write'},
        r = {":FzfLua oldfiles<CR>", "Open Recent File"},
        n = {":enew<CR>", "New File"},
        s = {":write<CR>", "Write File"},
        w = {":write<CR>", "Write File"}
    },

    g = {
        name = '+git',
        a = {':Git add %<CR>', 'add current file'},
        A = {':Git add .<CR>', 'add all changes'},
        b = {':Gitsigns blame_line<CR>', 'blame'},
        B = {':GBrowse<CR>', 'repo in browser'},
        c = {':Git commit<CR>', 'commit'},
        d = {':Git diff<CR>', 'diff'},
        D = {':Gdiffsplit<CR>', 'diff split'},
        g = {':Neogit<CR>', 'neogit'},
        h = {'<cmd>Gitsigns preview_hunk<CR>', 'preview hunk'},
        j = {'<cmd>Gitsigns next_hunk<CR>', 'next hunk'},
        k = {'<cmd>Gitsigns prev_hunk<CR>', 'previous hunk'},
        L = {':FloatermNew lazygit<CR>', 'lazygit'},
        l = {':Git log<CR>', 'log'},
        p = {':Git push<CR>', 'push'},
        P = {':Git pull<CR>', 'pull'},
        r = {':GRemove<CR>', 'remove'},
        S = {':Gstatus<CR>', 'status'},
        s = {'<cmd>Gitsigns stage_hunk<CR>', 'stage hunk'},
        t = {'<cmd>Gitsigns toggle_signs<CR>', 'toggle signs'},
        u = {'<cmd>Gitsigns reset_hunk<CR>', 'undo hunk'},
        v = {':FzfLua git_commits<CR>', 'view commits'},
        V = {':FzfLua git_bcommits<CR>', 'view buffer commits'},
        w = {'<cmd>Gitsigns toggle_word_diff<CR>', 'toggle word diff'},
    },

    H = {
        name = '+help',
        G = {':help g<CR>', 'g commands'},
        H = {'<cmd>FzfLua help_tags<CR>', 'help tags'},
        K = {"<cmd>FzfLua keymaps<cr>", "Key Maps"},
        -- m = {':Man<CR>', 'Man page for word'},
        M = {"<cmd>:Telescope man_pages<cr>", "Telescope Man Pages"},
        O = {"<cmd>:Telescope vim_options<cr>", "Options"},
        Z = {':help z<CR>', 'z commands'}
    },

    l = {
        name = '+lsp',
        [':'] = {'A;<Esc>', 'append ;'},
        a = {':lua vim.lsp.buf.code_action()<CR>', 'Code action'},
        D = {':FzfLua lsp_workspace_diagnostics<CR>', 'workspace diagnostics'},
        d = {':FzfLua lsp_document_diagnostics<CR>', 'doc diagnostics'},
        i = {':LspInfo<CR>', 'Lsp info'},
        f = {':Format<CR>', 'Format'},
        h = {':SidewaysLeft<CR>', 'Move arg left'},
        l = {':SidewaysRight<CR>', 'Move arg right'},
        R = {':LspRestart<CR>', 'Restart Lsp'},
        r = {':lua vim.lsp.buf.rename()<CR>', 'Rename'},
        s = {':FzfLua lsp_live_workspace_symbols<CR>', 'workspace symbols' },
        T = {':LspStart<CR>', 'Start Lsp'},
        t = {':LspStop<CR>', 'Stop Lsp'}
    },

    S = {
        name = '+spelling',
        A = {'zg', 'add to wordlist'},
        I = {
            name = '+ignore',
            I = {'zG', 'ignore for session'},
            P = {'[szG', 'ignore previous typo'},
            N = {']szG', 'ignore next typo'}

        },
        i = {'zG', 'ignore for session'},
        p = {'[s', 'prev misspelled word'},
        n = {']s', 'next misspelled word'},
        S = {':FzfLua spell_suggest<CR>', 'fzy spell suggest'},
        T = {':setlocal spell!<CR>', 'toggle spelling in buffer'},
        W = {'zw', 'mark word as wrong'}
    },

    s = {
        name = '+search',
        ['%'] = { "", 'search+replace in file' },
        ['.'] = { ":FzfLua grep_cword", 'search word' },
        ['/'] = {':FzfLua search_history/<CR>', 'search history'},
        [':'] = {':FzfLua command_history<CR>', 'command history'},
        [';'] = {':FzfLua commands<CR>', 'commands'},
        b = {':FzfLua lines<CR>', 'current buffer lines'},
        c = {':FzfLua git_commits<CR>', 'commits'},
        C = {':FzfLua git_bcommits<CR>', 'buffer commits'},
        f = {':FzfLua files<CR>', 'files'},
        g = {':FzfLua git_files<CR>', 'git files'},
        G = {':FzfLua git_status<CR>', 'modified git files'},
        h = {':FzfLua history<CR>', 'file history'},
        H = {':FzfLua history:<CR>', 'command history'},
        l = {':FzfLua lines<CR>', 'current buffer lines'},
        M = {':FzfLua marks<CR>', 'marks'},
        m = {':FzfLua keymaps<CR>', 'key maps'},
        r = {':FzfLua registers<CR>', 'registers'},
        s = {':FzfLua colorschemes<CR>', 'color schemes'},
        T = {':FzfLua btags<CR>', 'buffer tags'},
        t = {':FzfLua live_grep<CR>', 'text'},
        W = {':FzfLua grep_cWORD<CR>', 'search WORD'},
        w = {':FzfLua grep_cword<CR>', 'search word'},
        y = {':FzfLua filetypes<CR>', 'file types'},
        z = {':FzfLua<CR>', 'FzfLua'}
    },

    T = {
        name = '+test+term',
        F = {':TestFile<CR>', 'file'},
        G = {':FloatermNew lazygit<CR>', 'git'},
        D = {':FloatermNew lazydocker<CR>', 'docker'},
        L = {':TestLast<CR>', 'last'},
        N = {':TestNearest<CR>', 'nearest'},
        P = {':FloatermNew ipython<CR>', 'python'},
        S = {':TestSuite<CR>', 'suite'},
        T = {':FloatermToggle<CR>', 'toggle'},
        V = {':TestVisit<CR>', 'visit'}
    },

    u = {
        ['c'] = {'<cmd>lua require"dap".continue()<CR>', "description"},
        ['sv'] = {'<cmd>lua require"dap".step_over()<CR>', "description"},
        ['si'] = {'<cmd>lua require"dap".step_into()<CR>', "description"},
        ['so'] = {'<cmd>lua require"dap".step_out()<CR>', "description"},
        ['tb'] = {
            '<cmd>lua require"dap".toggle_breakpoint()<CR>', "description"
        },
        ['sbr'] = {
            '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
            "description"
        },
        ['sbm'] = {
            '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
            "description"
        },
        ['ro'] = {'<cmd>lua require"dap".repl.open()<CR>', "description"},
        ['rl'] = {'<cmd>lua require"dap".repl.run_last()<CR>', "description"},
        ['ui'] = {'<cmd>lua require"dapui".toggle()<CR>'},

        -- telescope-dap
        ['cc'] = {
            '<cmd>lua require"telescope".extensions.dap.commands{}<CR>',
            "description"
        },
        ['co'] = {
            '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>',
            "description"
        },
        ['lb'] = {
            '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',
            "description"
        },
        ['v'] = {
            '<cmd>lua require"telescope".extensions.dap.variables{}<CR>',
            "description"
        },
        ['f'] = {
            '<cmd>lua require"telescope".extensions.dap.frames{}<CR>',
            "description"
        }
    },
    w = {
        name = "+window",
        ["="] = {'<C-w>=', 'balance splits'},
        c = {'<C-w>c', 'close window'},
        H = {'<C-w>H', 'move left'},
        h = {'<C-w>h', 'change left'},
        J = {'<C-w>J', 'move down'},
        j = {'<C-w>j', 'change down'},
        K = {'<C-w>K', 'move up'},
        k = {'<C-w>k', 'change up'},
        L = {'<C-w>L', 'move right'},
        l = {'<C-w>l', 'change right'},
        m = {':MaximizerToggle!<CR>', 'maximizer toggle'},
        o = {'<C-w>o', 'only window'},
        q = {'<C-w>c', 'close window'},
        R = {'<C-w>R', 'rotate windows <-'},
        r = {'<C-w>r', 'rotate windows ->'},
        s = {':split<CR>', 'horizontal split'},
        t = {':tab split<CR>', 'new tab w/ current buf'},
        v = {':vsplit<CR>', 'veritcal split'},
        W = {'<C-w>W', 'other window <-'},
        w = {'<C-w>w', 'other window ->'},
        z = {':MaximizerToggle!<CR>', 'maximizer toggle'}
    }
}, {prefix = "<leader>"})

-- noremap = false option for using z= to trigger which-key spell suggestions
wk.register({
    F = {'z=', 'fix spelling'},
    N = {']sz=', 'fix next typo'},
    P = {'[sz=', 'fix previous typo'}
}, {prefix = "<leader>S", noremap = false})

-- Override dedfault description
wk.register({["zw"] = "Mark word as wrong"})

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {gc = "Comments"},
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<CR>"] = "RET",
        ["<tab>"] = "TAB"
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center" -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = {
        "<Plug>", "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:",
        "^ ", "<C-U>"
    }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = {"j", "k", "<Tab>", "<Space>"},
        v = {"j", "k"}
    }
}

-------------------------------------------
-- Non which-key registered mappings
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev({float={border="single"}})<CR>', opts)
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next({float={border="single"}})<CR>', opts)

-- Lua
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>TroubleRefresh<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xD", "<cmd>Trouble workspace_diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<CR>", opts)
