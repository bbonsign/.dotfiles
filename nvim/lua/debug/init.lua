require('telescope').load_extension('dap')
require('debug.python')

-- nvim-dap-ui
require("dapui").setup()

-- vim.api.nvim_set_keymap('n', '<leader>uc', '<cmd>lua require"dap".continue()<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>usv', '<cmd>lua require"dap".step_over()<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>usi', '<cmd>lua require"dap".step_into()<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>uso', '<cmd>lua require"dap".step_out()<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>utb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>usbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>usbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>uro', '<cmd>lua require"dap".repl.open()<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>url', '<cmd>lua require"dap".repl.run_last()<CR>')

-- -- telescope-dap
-- vim.api.nvim_set_keymap('n', '<leader>ucc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>uco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>ulb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>uv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>uf', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
