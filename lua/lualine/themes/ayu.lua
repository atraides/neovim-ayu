local colors = require('ayu.colors')
local M = {}

M.mode_colors = function()
  local mode_color = {
    n = colors.bright_blue,
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
  return { fg = mode_color[vim.fn.mode()] }
end

local _generators = {
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

M.style_fn = function(component) return _generators[component] end

return M
