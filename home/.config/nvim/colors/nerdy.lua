-- nerdy.lua - A light-on-dark "nerdy" theme (non-AMOLED)

vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.g.colors_name = 'nerdy'

local c = {
  bg = '#212121',
  fg = '#eeffff',
  gray = '#4a4a4a',
  darkgray = '#303030',
  comment = '#4a4a4a',
  alt_bg = '#353535',

  red = '#f07178',
  green = '#13ca91',
  yellow = '#fdf200',
  blue = '#7898fb',
  magenta = '#ff2079',
  cyan = '#00feca',
  orange = '#f78c6c',
  pink = '#ff5370',
  white = '#ffffff',
}

-- UI
vim.api.nvim_set_hl(0, 'Normal', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.alt_bg })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = c.alt_bg })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.comment })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Visual', { bg = c.darkgray })
vim.api.nvim_set_hl(0, 'Search', { bg = c.yellow, fg = c.bg })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = c.pink, fg = c.bg })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.fg, bg = c.alt_bg })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.alt_bg })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.fg, bg = c.alt_bg })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = c.bg, bg = c.blue })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = c.alt_bg })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = c.alt_bg })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = c.alt_bg })

-- Syntax
vim.api.nvim_set_hl(0, 'Comment', { fg = c.comment, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'Function', { fg = c.blue })
vim.api.nvim_set_hl(0, 'Statement', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.orange })
vim.api.nvim_set_hl(0, 'Type', { fg = c.green })
vim.api.nvim_set_hl(0, 'Special', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'Constant', { fg = c.orange })
vim.api.nvim_set_hl(0, 'String', { fg = c.green })
vim.api.nvim_set_hl(0, 'Number', { fg = c.orange })
