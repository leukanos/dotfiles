vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<cr>", { silent = true })

keymap.set("n", "x", '"_x')

-- split window

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>ss", "<C-w>s")
keymap.set("n", "<leader>sw", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- PLUGIN KEYMAPS

-- NERDTree

keymap.set("n", "<C-f>", ":Neotree focus reveal<CR>", { silent = true })
keymap.set("n", "<C-t>", ":Neotree toggle reveal<CR>", { silent = true })
keymap.set("n", "<leader>nr", ":Neotree reveal_force_cwd<CR>", { silent = true })
