
local M = {}

local colors = require('ayu.colors')

M.mode_color = function(mode, clrs)
  local modes = {
    n = clrs.blue,
    i = clrs.green,
    v = clrs.magenta,
    [' '] = clrs.blue,
    V = clrs.magenta,
    c = clrs.warning,
    no = clrs.warning,
    s = clrs.opeator,
    S = clrs.operator,
    ic = clrs.yellow,
    R = clrs.green,
    Rv = clrs.green,
    cv = clrs.red,
    ce = clrs.red,
    r = clrs.cyan,
    rm = clrs.cyan,
    ['r?'] = clrs.cyan,
    ['!'] = clrs.red,
    t = clrs.red,
  }
  return { fg = modes[mode] }
end

M.styles = {
  branch = function() return { fg = colors.green, gui = 'bold' } end,
  filename = function() return { fg = colors.magenta, gui = 'bold' } end,
  diff = {
    added = function() return { fg = colors.vcs_added } end,
    modified = function() return { fg = colors.vcs_modified } end,
    removed = function() return { fg = colors.vcs_removed } end,
  },
  diagnostics = {
    error = function() return { fg = colors.error } end,
    warn = function() return { fg = colors.warning } end,
    info = function() return { fg = colors.cyan } end,
  },
  lsp_status = function() return { fg = colors.black, gui = 'bold' } end,
  location = function() return { fg = colors.fg, gui = 'bold' } end,
  progress = function() return { fg = colors.fg, gui = 'bold' } end,
  line_close = function() return { fg = colors.blue, gui = 'bold' } end,
}

return M
