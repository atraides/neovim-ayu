
local M = {}

local colors = require('ayu.colors')

M.mode_color = function(mode, colors)
  local modes = {
    n = colors.blue,
    i = colors.green,
    v = colors.magenta,
    [' '] = colors.blue,
    V = colors.magenta,
    c = colors.warning,
    no = colors.warning,
    s = colors.opeator,
    S = colors.operator,
    ic = colors.yellow,
    R = colors.green,
    Rv = colors.green,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.red,
    t = colors.red,
  }
  return { fg = modes[mode] }
end

M.styles = function(component, colors)
  local components = {
    branch = { fg = colors.green, gui = 'bold' },
    filename = { fg = colors.magenta, gui = 'bold' },
    diff = {
      added = { fg = colors.vcs_added },
      modified = { fg = colors.vcs_modified },
      removed = { fg = colors.vcs_removed },
    },
    diagnostics = {
      error = { fg = colors.error },
      warn = { fg = colors.warning },
      info = { fg = colors.cyan },
    },
    lsp_status = { fg = colors.black, gui = 'bold' },
    location = { fg = colors.fg, gui = 'bold' },
    progress = { fg = colors.fg, gui = 'bold' },
    line_close = { fg = colors.blue, gui = 'bold' },
  }
  return components[component]
end

return M
