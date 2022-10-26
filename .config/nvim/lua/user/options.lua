-- :help options
local o = vim.opt

o.clipboard = 'unnamedplus'
o.swapfile = false
o.fileencoding = 'utf-8'
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.termguicolors = true
o.cursorline = true
o.number = true
o.numberwidth = 6
o.signcolumn = 'yes'
o.cmdheight = 2
o.scrolloff = 999
o.mouse = 'a'
o.colorcolumn = '80'
o.splitbelow = true
o.list = true   -- for indent-blankline
o.listchars:append("trail:╳")
--o.listchars:append("multispace:···❯")
--o.foldmethod = 'expr'
--o.foldexpr = 'nvim_treesitter#foldexpr()'
--o.foldnestmax=2
