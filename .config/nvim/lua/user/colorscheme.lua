-- local colorscheme = "dracula"
local colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_lualine_bold = false
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_dark_sidebar  = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
