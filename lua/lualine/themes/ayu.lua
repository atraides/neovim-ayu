local colors = require('ayu.colors')

local ayu = {
  visual = {
    a = { fg = colors.bg, bg = colors.accent, gui = 'bold' },
    b = { fg = colors.accent, bg = colors.panel_bg },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.markup, gui = 'bold' },
    b = { fg = colors.markup, bg = colors.panel_bg },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.panel_bg, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.panel_bg },
    c = { fg = colors.fg, bg = colors.panel_bg },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.entity, gui = 'bold' },
    b = { fg = colors.entity, bg = colors.panel_bg },
    c = { fg = colors.fg, bg = colors.panel_bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.string, gui = 'bold' },
    b = { fg = colors.string, bg = colors.panel_bg },
  },
  command = {
    a = { fg = colors.bg, bg = colors.constant, gui = 'bold' },
    b = { fg = colors.constant, bg = colors.panel_bg },
  },
  terminal = {
    a = { fg = colors.bg, bg = colors.string, gui = 'bold' },
    b = { fg = colors.string, bg = colors.panel_bg },
  },
}

return ayu
