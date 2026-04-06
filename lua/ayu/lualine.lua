local M = {}

local colors = require('ayu.colors')

M.mode_color = function(mode, current_colors)
  local modes = {
    n = current_colors.blue,
    i = current_colors.green,
    v = current_colors.magenta,
    [' '] = current_colors.blue,
    V = current_colors.magenta,
    c = current_colors.warning,
    no = current_colors.warning,
    s = current_colors.opeator,
    S = current_colors.operator,
    ic = current_colors.yellow,
    R = current_colors.green,
    Rv = current_colors.green,
    cv = current_colors.red,
    ce = current_colors.red,
    r = current_colors.cyan,
    rm = current_colors.cyan,
    ['r?'] = current_colors.cyan,
    ['!'] = current_colors.red,
    t = current_colors.red,
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
  lsp_status = function() return { fg = colors.bright_black, gui = 'bold' } end,
  location = function() return { fg = colors.fg } end,
  progress = function() return { fg = colors.fg, gui = 'bold' } end,
  line_close = function() return { fg = colors.blue, gui = 'bold' } end,
}

return M
