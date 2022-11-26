local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

--local actions = require("telescope.actions")

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader
--Remap ',' as localleader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
--  | n
--  | h : w, b, e, f and t for horizontal movement
-- l, L | jump to next search
keymap("n", "n", "k", opts)
keymap("n", "h", "j", opts)
keymap("n", "l", "n", opts)
keymap("n", "L", "N", opts)
keymap("n", "N", "<C-u>", opts)
keymap("n", "H", "<C-d>", opts)
keymap("n", "<S-u>", "<C-r>", opts)
keymap("n", "<Esc>", ":noh<CR>", opts)
keymap("n", "<localleader>.", ":NvimTreeToggle<cr>", opts)
keymap("n", "<localleader>q", "<cmd>copen<cr>", opts)
keymap("n", "<localleader>Q", "<cmd>cclose<cr>", opts)
keymap("n", "<localleader>N", "<cmd>cnext<cr>", opts)
keymap("n", "<localleader>H", "<cmd>cprev<cr>", opts)

-- Insert --

-- Visual --
-- My HJKL --
keymap("v", "h", "j", opts)
keymap("v", "n", "k", opts)
keymap("v", "l", "n", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-h>", ":m .+1<CR>==", opts)
keymap("v", "<A-n>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-h>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-n>", ":move '<-2<CR>gv-gv", opts)

-- Window navigation --
--    | n, e, i
--  | h
keymap("n", "<localleader>n", "<C-w>k", opts)
keymap("n", "<localleader>h", "<C-w>j", opts)
keymap("n", "<localleader>e", "<C-w>h", opts)
keymap("n", "<localleader>i", "<C-w>l", opts)
-- swap windows
keymap("n", "<localleader>x", "<C-w>x", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-r>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-n>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-t>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<Esc>", "<C-\\><C-N>", term_opts)

-- Telescope --
-- Pickers
-- keymap("n", "<localleader><localleader>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<localleader><leader>", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>ts", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>tm", "<cmd>Telescope man_pages<cr>", opts)
keymap("n", "<leader>th", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope builtin<cr>", opts)

-- LSP pickers
-- TODO

