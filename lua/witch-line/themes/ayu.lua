--- Ayu theme for witch-line.
---
--- Two usage styles are provided:
---
--- 1. **Static tables** (`M.normal`, `M.insert`, etc.)
---    Plain tables whose hex values are captured from `ayu.colors` at the moment
---    this module is first `require`'d.  Only use these when you can guarantee that
---    `vim.cmd.colorscheme("ayu")` (or a variant) has already run before requiring
---    this module.
---
---    Example (safe load order):
---
---      vim.cmd.colorscheme("ayu")
---      local ayu = require("witch-line.themes.ayu")
---      require("witch-line").setup({
---        statusline = {
---          global = {
---            { [0] = "mode", style = ayu.normal },
---            ...
---          },
---        },
---      })
---
--- 2. **Style functions** (`M.style_fn(mode)`)
---    Returns a function that reads from `ayu.colors` on every call.  Because
---    `ayu.colors` is the same Lua table that `colors.generate()` mutates in-place,
---    the function always returns fresh values reflecting the current colorscheme —
---    even if this module was required before the colorscheme was applied.
---    witch-line calls function-type `style` fields on every component update, so
---    colors will be correct from the first render that happens after the colorscheme
---    loads.  Use this variant when load order is not guaranteed (typical with
---    lazy-loading plugin managers).
---
---    Example (load-order independent):
---
---      local ayu = require("witch-line.themes.ayu")
---      require("witch-line").setup({
---        statusline = {
---          global = {
---            { [0] = "mode", style = ayu.style_fn("normal") },
---            ...
---          },
---        },
---      })
---
--- @module witch-line.themes.ayu

local colors = require('ayu.colors')

local M = {}

-- ---------------------------------------------------------------------------
-- Static style tables
-- Hex values are captured from ayu.colors at require() time.
-- Safe only when the colorscheme has already been applied.
-- ---------------------------------------------------------------------------

--- Style for normal mode (fg = bg color, bg = entity color).
M.normal   = { fg = colors.bg, bg = colors.entity,   bold = true }
--- Style for insert mode (fg = bg color, bg = string color).
M.insert   = { fg = colors.bg, bg = colors.string,   bold = true }
--- Style for visual mode (fg = bg color, bg = accent color).
M.visual   = { fg = colors.bg, bg = colors.accent,   bold = true }
--- Style for replace mode (fg = bg color, bg = markup color).
M.replace  = { fg = colors.bg, bg = colors.markup,   bold = true }
--- Style for command mode (fg = bg color, bg = constant color).
M.command  = { fg = colors.bg, bg = colors.constant, bold = true }
--- Style for terminal mode (fg = bg color, bg = string color).
M.terminal = { fg = colors.bg, bg = colors.string,   bold = true }
--- Style for inactive windows (fg = fg color, bg = panel_bg color).
M.inactive = { fg = colors.fg, bg = colors.panel_bg, bold = true }

--- Secondary style – panel background sections (equivalent to lualine section b/c).
M.normal_b   = { fg = colors.entity,   bg = colors.panel_bg }
M.insert_b   = { fg = colors.string,   bg = colors.panel_bg }
M.visual_b   = { fg = colors.accent,   bg = colors.panel_bg }
M.replace_b  = { fg = colors.markup,   bg = colors.panel_bg }
M.command_b  = { fg = colors.constant, bg = colors.panel_bg }
M.terminal_b = { fg = colors.string,   bg = colors.panel_bg }
M.inactive_b = { fg = colors.fg,       bg = colors.panel_bg }

-- ---------------------------------------------------------------------------
-- Style-function generators
-- Each generator closes over the `colors` table reference (not its values).
-- Because ayu.colors.generate() mutates that same table in-place, calling
-- these generators after the colorscheme has loaded always yields correct hex
-- strings regardless of when this module was first required.
-- ---------------------------------------------------------------------------

--- @alias WitchLineStyleFn fun(self: table, sid: any): table

local _generators = {
  normal   = function() return { fg = colors.bg, bg = colors.entity,   bold = true } end,
  insert   = function() return { fg = colors.bg, bg = colors.string,   bold = true } end,
  visual   = function() return { fg = colors.bg, bg = colors.accent,   bold = true } end,
  replace  = function() return { fg = colors.bg, bg = colors.markup,   bold = true } end,
  command  = function() return { fg = colors.bg, bg = colors.constant, bold = true } end,
  terminal = function() return { fg = colors.bg, bg = colors.string,   bold = true } end,
  inactive = function() return { fg = colors.fg, bg = colors.panel_bg, bold = true } end,

  normal_b   = function() return { fg = colors.entity,   bg = colors.panel_bg } end,
  insert_b   = function() return { fg = colors.string,   bg = colors.panel_bg } end,
  visual_b   = function() return { fg = colors.accent,   bg = colors.panel_bg } end,
  replace_b  = function() return { fg = colors.markup,   bg = colors.panel_bg } end,
  command_b  = function() return { fg = colors.constant, bg = colors.panel_bg } end,
  terminal_b = function() return { fg = colors.string,   bg = colors.panel_bg } end,
  inactive_b = function() return { fg = colors.fg,       bg = colors.panel_bg } end,
}

--- Returns a style function for the given mode name.
---
--- The returned function reads directly from the shared `ayu.colors` table on
--- every invocation, so it always reflects the active colorscheme variant
--- (dark / mirage / light).  witch-line treats function-valued `style` fields
--- as dynamic and calls them on every component update, making this the
--- load-order-independent way to use ayu colors with witch-line.
---
--- @param mode string  One of: "normal", "insert", "visual", "replace", "command",
---                     "terminal", "inactive", or any of those suffixed with "_b"
---                     (e.g. "normal_b") for the panel-background secondary style.
--- @return WitchLineStyleFn style_fn  A function `(self, sid) -> table` suitable
---                                    for use as a witch-line `style` field value.
M.style_fn = function(mode)
  return _generators[mode]
end

--- Returns the active ayu color palette as a plain table.
--- Only valid after `colors.generate()` has been called (i.e. after the
--- colorscheme has been applied).
---
--- @return table palette  A snapshot of the current ayu color values.
M.palette = function()
  return {
    bg           = colors.bg,
    fg           = colors.fg,
    entity       = colors.entity,
    string       = colors.string,
    accent       = colors.accent,
    markup       = colors.markup,
    constant     = colors.constant,
    keyword      = colors.keyword,
    func         = colors.func,
    tag          = colors.tag,
    regexp       = colors.regexp,
    comment      = colors.comment,
    panel_bg     = colors.panel_bg,
    fg_idle      = colors.fg_idle,
    vcs_added    = colors.vcs_added,
    vcs_modified = colors.vcs_modified,
    vcs_removed  = colors.vcs_removed,
  }
end

return M
