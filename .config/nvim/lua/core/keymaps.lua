vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<cr>")

keymap.set("n", "x", '"_x')

-- split window

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>ss", "<C-w>s")
keymap.set("n", "<leader>sw", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- PLUGIN KEYMAPS

-- NERDTree

keymap.set("n", "<C-f>", ":NERDTreeFocus<CR>", { silent = true })
keymap.set("n", "<C-n>", ":NERDTree<CR>", { silent = true })
keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { silent = true })
