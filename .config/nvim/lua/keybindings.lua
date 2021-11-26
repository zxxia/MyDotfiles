-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- local variables
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Easier split navigations
map("n", "<C-j>", "<C-w><C-j>", opt)
map("n", "<C-k>", "<C-w><C-k>", opt)
map("n", "<C-l>", "<C-w><C-l>", opt)
map("n", "<C-h>", "<C-w><C-h>", opt)

-- Consistent with C and D
map("n", "Y", "y$", opt)

-- Easy navigation among tabs
map("n", "<Leader>h", ":bprevious<CR>", opt)
map("n", "<Leader>l", ":bnext<CR>", opt)

-- Keep visual mode after indent
map("v", ">", ">gv", opt)
map("v", "<", "<gv", opt)

-- Keep cursor at the bottom of the visual selection after you yank it.
map("v", "y", "ygv<Esc>", opt)

-- undo break points
map("i", ",", ",<c-g>u", opt)
map("i", ".", ".<c-g>u", opt)
map("i", "!", "!<c-g>u", opt)
map("i", "?", "?<c-g>u", opt)

-- use EMACS keybinds under INSERT mode
map("i", "<c-a>", "<home>", opt)
map("i", "<c-e>", "<end>", opt)
map("i", "<c-d>", "<del>", opt)

-- use EMACS keybinds under COMMAND mode
map("c", "<c-a>", "<home>", opt)
map("c", "<c-e>", "<end>", opt)
map("c", "<c-d>", "<del>", opt)

-- Prevent selecting and pasting from overwriting what you originally copied.
map("x", "p", "pgvy", opt)
