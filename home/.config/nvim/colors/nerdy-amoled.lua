-- nerdy_amoled.lua
-- A minimal AMOLED-friendly color scheme for Neovim

vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.g.colors_name = 'nerdy_amoled'

local colors = {
  bg = '#000000',
  fg = '#eeffff',
  red = '#f07178',
  green = '#13ca91',
  yellow = '#fdf200',
  blue = '#7898fb',
  magenta = '#ff2079',
  cyan = '#00feca',
  white = '#eeffff',
  gray = '#202020',
  orange = '#f78c6c',
  pink = '#ff5370',
  comment = '#4a4a4a',
  alt_bg = '#202020',
}

-- Basic highlights
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.alt_bg })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = colors.alt_bg })
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.comment })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, 'Visual', { bg = colors.alt_bg })
vim.api.nvim_set_hl(0, 'Search', { bg = colors.yellow, fg = colors.bg })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = colors.pink, fg = colors.bg })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg, bg = colors.gray })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.fg, bg = colors.alt_bg })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.gray })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = colors.gray })

-- Syntax
vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.magenta })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.magenta })
vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Type', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Special', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.orange })

-- Barbar background customization
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = colors.gray })
vim.api.nvim_set_hl(0, 'BufferTabpages', { bg = colors.gray, fg = colors.fg })
vim.api.nvim_set_hl(0, 'BufferInactive', { bg = colors.gray, fg = colors.comment })
vim.api.nvim_set_hl(0, 'BufferVisible', { bg = colors.gray, fg = colors.fg })
vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = colors.gray, fg = colors.fg, bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = colors.gray, fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { bg = colors.gray, fg = colors.yellow })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { bg = colors.gray, fg = colors.comment })

-- MiniStatusline mode-based highlights
vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { fg = colors.bg, bg = colors.green, bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { fg = colors.bg, bg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { fg = colors.bg, bg = colors.magenta, bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { fg = colors.bg, bg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { fg = colors.bg, bg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeOther', { fg = colors.bg, bg = colors.orange, bold = true })

-- MiniStatusline default sections
vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { fg = colors.fg, bg = colors.gray })
vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = colors.blue, bg = colors.gray, bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = colors.fg, bg = colors.gray })
