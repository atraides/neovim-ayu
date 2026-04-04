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

M.styles = {
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

return M
