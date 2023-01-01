vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<cr>", { silent = true })

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>w", ":bd<CR>", { silent = true })
keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
keymap.set("n", "<leader>Q", ":qa<CR>", { silent = true })
keymap.set("n", "<leader>W", ":qa!<CR>", { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "nzzzv")

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

-- Telescope

keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
keymap.set("n", "<leader>fa", ":Telescope commands<cr>")
keymap.set("n", "<leader>fn", "lua require('telescope-config').grep_prompt()<cr>")
keymap.set("n", "<leader>nv", "lua require('telescope-config').nvim_config()<cr>")
keymap.set("n", "<leader>k", "lua require('telescope').extensions.command_palette.command_palette()<cr>")
keymap.set("n", "<leader>g", "lua require('telescope.builtin').grep_string{}<cr>")
