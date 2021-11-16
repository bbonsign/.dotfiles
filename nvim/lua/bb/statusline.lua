require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'github',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}



--
-- Old galaxyline config
--
-- local gl = require('galaxyline')
-- local colors = require('galaxyline.theme').default
-- local condition = require('galaxyline.condition')
-- -- local fileinfo = require('galaxyline.provider_fileinfo')
-- local section = gl.section
-- -- local fn = vim.fn

-- gl.short_line_list = {'NvimTree','vista','dbui','packer'}

-- local function file_readonly(readonly_icon)
--   if vim.bo.filetype == 'help' then
--     return ''
--   end
--   local icon = readonly_icon or ''
--   if vim.bo.readonly == true then
--     return " " .. icon .. " "
--   end
--   return ''
-- end

-- local function file_info(modified_icon, readonly_icon)
--   local file = vim.fn.expand('%:f')
--   if vim.fn.empty(file) == 1 then return '' end
--   if string.len(file_readonly(readonly_icon)) ~= 0 then
--     return file .. file_readonly(readonly_icon)
--   end
--   local icon = modified_icon or ''
--   if vim.bo.modifiable then
--     if vim.bo.modified then
--       return file .. ' ' .. icon .. '  '
--     end
--   end
--   return file .. ' '
-- end

-- section.left[1] = {
--   RainbowRed = {
--     provider = function() return '▊ ' end,
--     highlight = {colors.blue,colors.bg}
--   },
-- }
-- section.left[2] = {
--   ViMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_color = {n = colors.green, i = colors.blue,v=colors.magenta,
--                           [''] = colors.magenta,V=colors.magenta,
--                           c = colors.magenta,no = colors.red,s = colors.orange,
--                           S=colors.orange,[''] = colors.orange,
--                           ic = colors.yellow,R = colors.violet,Rv = colors.violet,
--                           cv = colors.red,ce=colors.red, r = colors.cyan,
--                           rm = colors.cyan, ['r?'] = colors.cyan,
--                           ['!']  = colors.red,t = colors.red}
--       vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
--       return 'ᚡ '
--     end,
--     highlight = {colors.red,colors.bg,'bold'},
--   },
-- }

-- section.left[3] = {
--   FileSize = {
--     provider = 'FileSize',
--     separator = '⟨',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.fg,colors.bg}
--   }
-- }

-- section.left[4] = {
--   LineInfo = {
--     provider = 'LineColumn',
--     separator = '⟩',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.fg,colors.bg},
--   },
-- }

-- section.left[5] = {
--   PerCent = {
--     provider = 'LinePercent',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }

-- section.left[6] = {
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = condition.buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
--   },
-- }

-- section.left[7] = {
--   FileName = {
--     -- provider = 'FileName',
--     provider = function ()
--       return file_info()
--     end,
--     -- provider = function()
--     --   return fn.expand("%:F")
--     -- end,
--     condition = condition.buffer_not_empty,
--     separator = " ",
--     highlight = {colors.violet,colors.bg,'bold'}
--   }
-- }



-- section.mid[1] = {
--   ShowLspClient = {
--     provider = 'GetLspClient',
--     condition = function ()
--       local tbl = {['dashboard'] = true,['']=true}
--       if tbl[vim.bo.filetype] then
--         return false
--       end
--       return true
--     end,
--     icon = '  LSP: ',
--     highlight = {colors.cyan,colors.bg,'bold'}
--   }
-- }

-- section.mid[4] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     icon = '   ',
--     highlight = {colors.cyan,colors.bg},
--   }
-- }

-- section.mid[2] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '   ',
--     highlight = {colors.red,colors.bg}
--   }
-- }

-- section.mid[3] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '   ',
--     highlight = {colors.yellow,colors.bg},
--   }
-- }

-- section.mid[5] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     icon = '   ',
--     highlight = {colors.blue,colors.bg},
--   }
-- }

-- section.right[1] = {
--   FileEncode = {
--     provider = 'FileEncode',
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.green,colors.bg,'bold'}
--   }
-- }

-- section.right[2] = {
--   FileFormat = {
--     provider = 'FileFormat',
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.green,colors.bg,'bold'}
--   }
-- }

-- section.right[3] = {
--   GitIcon = {
--     provider = function() return '  ' end,
--     condition = condition.check_git_workspace,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }

-- section.right[4] = {
--   GitBranch = {
--     provider = 'GitBranch',
--     separator = '  ',
--     condition = condition.check_git_workspace,
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }

-- section.right[5] = {
--   DiffAdd = {
--     provider = 'DiffAdd',
--     condition = condition.hide_in_width,
--     icon = '   ',
--     highlight = {colors.green,colors.bg},
--   }
-- }
-- section.right[6] = {
--   DiffModified = {
--     provider = 'DiffModified',
--     condition = condition.hide_in_width,
--     icon = '  𝚫 ',
--     highlight = {colors.orange,colors.bg},
--   }
-- }
-- section.right[7] = {
--   DiffRemove = {
--     provider = 'DiffRemove',
--     condition = condition.hide_in_width,
--     icon = '  ',
--     highlight = {colors.red,colors.bg},
--   }
-- }

-- section.right[8] = {
--   RainbowBlue = {
--     provider = function() return '  ▊' end,
--     highlight = {colors.blue,colors.bg}
--   },
-- }

-- section.short_line_left[1] = {
--   BufferType = {
--     provider = 'FileTypeName',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.blue,colors.bg,'bold'}
--   }
-- }

-- section.short_line_left[2] = {
--   SFileName = {
--     provider =  'SFileName',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.fg,colors.bg,'bold'}
--   }
-- }

-- section.short_line_right[1] = {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     highlight = {colors.fg,colors.bg}
--   }
-- }
