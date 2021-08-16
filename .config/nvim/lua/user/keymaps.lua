local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Move to the start of line
keymap("n", "H", "^", opts)
keymap("v", "H", "^", opts)

-- Move to the end of line
keymap("n", "L", "$", opts)
keymap("v", "L", "$", opts)

-- Redo
keymap("n", "U", "<C-r>", opts)

-- Yank to the end of line
keymap("n", "Y", "y$", opts)

-- Tab
keymap("n", "<Tab>", ">>", opts)
keymap("n", "<S-Tab>", "<<", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Better window navigation
keymap("n", "<C-S-h>", "<C-w>h", opts)
keymap("n", "<C-S-j>", "<C-w>j", opts)
keymap("n", "<C-S-k>", "<C-w>k", opts)
keymap("n", "<C-S-l>", "<C-w>l", opts)
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

-- Window split
keymap("n", "<leader>ws", "<C-W>s", opts)
keymap("n", "<leader>wv", "<C-W>v", opts)

-- Clipboard
keymap("n", "d", "\"_d", opts)
keymap("n", "D", "\"_D", opts)
keymap("n", "s", "\"_s", opts)
keymap("n", "S", "\"_S", opts)
keymap("n", "c", "\"_c", opts)
keymap("n", "C", "\"_C", opts)
keymap("n", "x", "\"_x", opts)
keymap("n", "X", "\"_x", opts)
keymap("v", "d", "\"_d", opts)
keymap("v", "d", "\"_c", opts)
keymap("x", "p", "\"_dP", opts)
keymap("v", "p", '"_dP', opts)

-- Buffer navigation
keymap("n", "tl", ":bnext<CR>", opts)
keymap("n", "th", ":bprevious<CR>", opts)
keymap("n", "<C-h>", ":bnext<CR>", opts)
keymap("n", "<C-l>", ":bprevious<CR>", opts)

-- Comment
keymap("v", "<leader>kc", ":lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<CR>", opts)

-- File save
-- keymap("n", "<leader>fs", ":w<CR>", opts)
-- keymap("n", "<leader>fS", ":wa<CR>", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Multi Cursor
vim.cmd([[
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<leader>d'
let g:VM_maps['Find Subword Under'] = '<leader>d'
let g:VM_maps['Select All']         = '<leader>D'
let g:VM_maps['Add Cursor Down']    = '<C-A-j>'
let g:VM_maps['Add Cursor Up']    = '<C-A-k>'
]])

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
