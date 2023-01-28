vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true })

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>w", ":bd<CR>", { silent = true })
keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
keymap.set("n", "<leader>Q", ":qa<CR>", { silent = true })
keymap.set("n", "<leader>W", ":qa!<CR>", { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "nzzzv")

keymap.set("n", "<leader>[", ":bprevious<CR>", { silent = true })
keymap.set("n", "<leader>]", ":bnext<CR>", { silent = true })
keymap.set("n", "<leader>p", ":blast<CR>", { silent = true })

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

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })
keymap.set("n", "<leader>fa", ":Telescope commands<CR>", { silent = true })
keymap.set("n", "<leader>fr", ":Telescope frecency<CR>", { silent = true })
keymap.set("n", "<leader>fn", ":lua require('plugins/telescope-config').grep_prompt()<CR>", { silent = true })
keymap.set("n", "<leader>nv", ":Telescope frecency wokspace=nvim<CR>", { silent = true })
keymap.set("n", "<leader>k", ":lua require('telescope').extensions.command_palette.command_palette()<CR>", { silent = true })
keymap.set("n", "<leader>g", ":lua require('telescope.builtin').grep_string{}<CR>", { silent = true })

-- UndoTree

keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true })

-- lsp

keymap.set('n', 'gh', ':Lspsaga lsp_finder<CR>', { silent = true })

keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", { silent = true })
keymap.set("n", "gD", ":lua vim.lsp.buf.definition()<CR>", { silent = true })
keymap.set("n", "gr", ":Lspsaga rename<CR>", { silent = true })
keymap.set("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
keymap.set("n", "<C-k>", ":Lspsaga signature_help<CR>", { silent = true })
keymap.set("n", "<leader>o", ":Lspsaga outline<CR>", { silent = true })

keymap.set("n", "]e", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap.set("n", "[e", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Trouble

keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { silent = true })
keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", { silent = true })
keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", { silent = true })
keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>", { silent = true })
keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>", { silent = true })
keymap.set("n", "gR", ":TroubleToggle lsp_references<CR>", { silent = true })

-- Gitsigns

keymap.set("n", "<leader>hr", ":lua require('gitsigns').reset_hunk()<CR>", { silent = true })
keymap.set("n", "<leader>hs", ":lua require('gitsigns').stage_hunk()<CR>", { silent = true })
keymap.set("n", "<leader>hS", ":lua require('gitsigns').stage_buffer()<CR>", { silent = true })

-- fzf-lsp

-- keymap.set('n', '<leader>fs', ':DocumentSymbol<CR>')
-- keymap.set('n', '<leader>fw', ':WorkspaceSymbol<CR>')
-- keymap.set('n', '<leader>fd', ':Definition<CR>')
-- keymap.set('n', '<leader>fdc', ':Declarations<CR>')
-- keymap.set('n', '<leader>fr', ':References<CR>')
-- keymap.set('n', '<leader>fi', ':Implementation<CR>')
-- keymap.set('n', '<leader>ft', ':TypeDefinition<CR>')
-- keymap.set('n', '<leader>fa', ':CodeAction<CR>')
-- keymap.set('n', '<leader>fe', ':Diagnostics<CR>')
