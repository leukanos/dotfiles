-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/leukanos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/leukanos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/leukanos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/leukanos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/leukanos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-ctags"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-ctags",
    url = "https://github.com/delphinus/cmp-ctags"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-look",
    url = "https://github.com/hrsh7th/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\2“\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\15suggestion\1\0\0\vkeymap\1\0\2\rdebounce\3d\vaccept\n<C-l>\1\0\2\17auto_trigger\2\fenabled\2\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  fzf = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lsp.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/fzf-lsp.nvim",
    url = "https://github.com/gfanto/fzf-lsp.nvim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["heirline.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2Š\3\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\21filetype_exclude\1\t\0\0\thelp\vpacker\14dashboard\17neogitstatus\rNvimTree\fTrouble\20TelescopePrompt\21TelescopeResults\20buftype_exclude\1\0\a\29show_current_context_end\2\21show_end_of_line\2\31show_current_context_start\2\25space_char_blankline\6 #show_trailing_blankline_indent\1\25show_current_context\2\28show_first_indent_level\1\1\2\0\0\rterminal\nsetup\21indent_blankline\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\2V\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\aui\1\0\0\1\0\1\ntheme\nround\nsetup\flspsaga\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    after = { "null-ls.nvim" },
    config = { "\27LJ\2\2Ï\1\0\2\5\1\t\0\0199\2\0\0009\2\1\2\15\0\2\0X\3\5€-\2\0\0009\2\2\2\18\3\0\0\18\4\1\0B\2\3\0016\2\3\0'\3\4\0B\2\2\0029\2\5\0025\3\6\0005\4\a\0=\4\b\3\18\4\1\0B\2\3\1K\0\1\0\0À\17handler_opts\1\0\1\vborder\frounded\1\0\1\tbind\2\14on_attach\18lsp_signature\frequire\vattach\27documentSymbolProvider\24server_capabilitiesm\0\1\4\2\6\0\f6\1\0\0'\2\1\0B\1\2\0028\1\0\0019\1\2\0015\2\3\0-\3\0\0=\3\4\2-\3\1\0=\3\5\2B\1\2\1K\0\1\0\2À\1À\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\frequireÚ\1\0\0\6\2\15\0\0206\0\0\0'\1\1\0B\0\2\0029\0\2\0009\0\3\0005\1\v\0005\2\t\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\3=\3\n\2=\2\f\1-\2\0\0=\2\r\1-\2\1\0=\2\14\1B\0\2\1K\0\1\0\2À\1À\17capabilities\14on_attach\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\3\0\0\bvim\19packer_plugins\nsetup\16sumneko_lua\14lspconfig\frequireû\2\1\0\6\0\15\0\0296\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\1B\1\1\0023\2\4\0006\3\0\0'\4\5\0B\3\2\0029\3\6\0035\4\b\0005\5\a\0=\5\t\4B\3\2\0016\3\0\0'\4\5\0B\3\2\0029\3\n\0035\4\r\0003\5\v\0>\5\1\0043\5\f\0=\5\14\4B\3\2\0012\0\0€K\0\1\0\16sumneko_lua\1\0\0\0\0\19setup_handlers\21ensure_installed\1\0\0\1\16\0\0\vbashls\rdockerls\ngopls\fgraphql\14grammarly\vjsonls\16sumneko_lua\16terraformls\nvimls\vyamlls\thtml\17intelephense\rtsserver\ncssls\veslint\nsetup\20mason-lspconfig\0\25default_capabilities\17cmp_nvim_lsp\15nvim-navic\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    config = { "\27LJ\2\2j\0\0\3\0\5\0\t6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\3\0B\1\2\0019\1\4\0B\1\1\1K\0\1\0\19setup_handlers\1\0\1\20automatic_setup\2\nsetup\18mason-null-ls\frequire\0" },
    load_after = {
      ["null-ls.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/mason-null-ls.nvim",
    url = "https://github.com/jay-babu/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    commands = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate", "MasonUpdateAll" },
    config = { "\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    after = { "nui.nvim" },
    commands = { "Neotree" },
    config = { "\27LJ\2\2í\b\0\0\4\0&\0:6\0\0\0009\0\1\0009\0\2\0\14\0\0\0X\0\4€6\0\3\0009\0\4\0'\1\5\0B\0\2\0016\0\0\0009\0\6\0009\0\2\0\14\0\0\0X\0\4€6\0\3\0009\0\4\0'\1\a\0B\0\2\0016\0\0\0009\0\b\0009\0\2\0\14\0\0\0X\0\4€6\0\3\0009\0\4\0'\1\t\0B\0\2\0016\0\n\0'\1\v\0B\0\2\0029\0\f\0005\1\r\0005\2\15\0005\3\14\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0=\3\24\2=\2\25\0015\2\27\0005\3\26\0=\3\28\2=\2\29\0015\2\31\0005\3\30\0=\3 \2=\2!\0015\2\"\0=\2#\0015\2$\0=\2%\1B\0\2\1K\0\1\0\20source_selector\1\0\1\vwinbar\2\vbuffer\1\0\1\24follow_current_file\2\15filesystem\19filtered_items\1\0\2\27use_libuv_file_watcher\2\24follow_current_file\2\1\0\1\18hide_dotfiles\1\vwindow\rmappings\1\0\0\1\0\2\ass\15open_split\asv\16open_vsplit\30default_component_configs\tname\1\0\3\19trailing_slash\2\26use_git_status_colors\2\14highlight\20NeoTreeFileName\rmodified\1\0\2\vsymbol\b[+]\14highlight\20NeoTreeModified\ticon\1\0\5\fdefault\6*\14highlight\20NeoTreeFileIcon\16older_empty\bï°Š\16folder_open\bî—¾\18folder_closed\bî—¿\vindent\1\0\a\22expander_expanded\bï‘¼\23expander_collapsed\bï‘ \14highlight\24NeoTreeIndentMarker\24expander_highliight\20NeoTreeExpander\16indent_size\3\2\16with_marker\6|\fpadding\3\1\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\4\23popup_border_style\frounded\25close_if_last_window\2\22enable_git_status\2\26sort_case_insensitive\1\nsetup\rneo-tree\frequire\21packadd nui.nvim\rnui.nvim\30packadd nvim-web-devicons\22nvim-web-devicons\26packadd neo-tree.nvim\bcmd\bvim\vloaded\18neo-tree.nvim\19packer_plugins\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    load_after = {
      ["neo-tree.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    after = { "mason-null-ls.nvim" },
    config = { "\27LJ\2\2{\0\0\5\0\b\0\r6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\6\0004\3\3\0009\4\3\0009\4\4\0049\4\5\4>\4\1\3=\3\a\2B\1\2\1K\0\1\0\fsources\1\0\0\rgitsigns\17code_actions\rbuiltins\nsetup\fnull-ls\frequire\0" },
    load_after = {
      ["mason-lspconfig.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2³\2\0\0\b\0\15\0\0256\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0015\2\4\0005\3\5\0=\3\6\2B\1\2\0016\1\0\0'\2\a\0B\1\2\0029\2\b\0\18\3\2\0009\2\t\2'\4\n\0009\5\v\0015\6\r\0005\a\f\0=\a\14\6B\5\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\21disable_filetype\1\3\0\0\20TelescopePrompt\bvim\1\0\3\17map_complete\2\16auto_select\2\vmap_cr\2\nsetup\19nvim-autopairs\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "lspsaga.nvim", "mason-lspconfig.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\2H\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-context-commentstring", "nvim-treesitter-context", "indent-blankline.nvim", "nvim-ts-autotag", "nvim-treesitter-textobjects" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\2=\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["sql.nvim"] = {
    load_after = {
      ["telescope-frecency.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/sql.nvim",
    url = "https://github.com/tami5/sql.nvim"
  },
  ["telescope-command-palette.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    after = { "sql.nvim" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    after = { "popup.nvim", "telescope-project.nvim", "telescope-frecency.nvim", "telescope-media-files.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\2Ï\16\0\0\b\0N\0¶\0016\0\0\0009\0\1\0'\1\2\0B\0\2\0026\1\3\0009\1\4\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\b\0B\1\2\0016\1\3\0009\1\t\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\n\0B\1\2\0016\1\3\0009\1\v\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\f\0B\1\2\0016\1\3\0009\1\r\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\14\0B\1\2\0016\1\3\0009\1\15\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\16\0B\1\2\0016\1\3\0009\1\17\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\18\0B\1\2\0016\1\3\0009\1\19\0019\1\5\1\14\0\1\0X\1\4€6\1\6\0009\1\a\1'\2\20\0B\1\2\0016\1\21\0'\2\22\0B\1\2\0029\1\23\0015\2.\0005\3\25\0005\4\24\0=\4\26\0035\4\28\0005\5\27\0=\5\29\0045\5\30\0=\5\31\4=\4 \0034\4\0\0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0036\4\21\0'\5&\0B\4\2\0029\4'\0049\4(\4=\4)\0036\4\21\0'\5&\0B\4\2\0029\4*\0049\4(\4=\4+\0036\4\21\0'\5&\0B\4\2\0029\4,\0049\4(\4=\4-\3=\3/\0025\0031\0005\0040\0=\0042\0035\0043\0005\0054\0=\0055\0045\0057\0\18\6\0\0'\a6\0&\6\a\6=\0068\5\18\6\0\0'\a9\0&\6\a\6=\6:\5\18\6\0\0'\a;\0&\6\a\6=\6<\5\18\6\0\0'\a=\0&\6\a\6=\6>\5\18\6\0\0'\a?\0&\6\a\6=\6@\5\18\6\0\0'\aA\0&\6\a\6=\6B\5=\5C\4=\4D\0034\4\3\0005\5E\0005\6F\0>\6\2\0055\6G\0>\6\3\0055\6H\0>\6\4\5>\5\1\4=\4I\3=\3J\2B\1\2\0016\1\21\0'\2\22\0B\1\2\0029\1K\1'\0022\0B\1\2\0016\1\21\0'\2\22\0B\1\2\0029\1K\1'\2L\0B\1\2\0016\1\21\0'\2\22\0B\1\2\0029\1K\1'\2I\0B\1\2\0016\1\21\0'\2\22\0B\1\2\0029\1K\1'\2D\0B\1\2\0016\1\21\0'\2\22\0B\1\2\0029\1K\1'\2M\0B\1\2\1K\0\1\0\16media_files\17file_browser\19load_extension\15extensions\20command_palette\1\3\0\0\18Browse config2lua require('telescope-config').nvim_config()\1\3\0\0\16checkhealth\17:checkhealth\1\3\0\0\vsource\14:source %\1\2\0\0\tNVim\rfrecency\15workspaces\ago\f/go/src\bcpp\14/code/cpp\tcode\n/code\tnvim\18/.config/nvim\tdata\18/.local/share\tconf\1\0\0\r/.config\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\2\19show_unindexed\2\16show_scores\2\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\bâ”€\bâ”‚\bâ”€\bâ”‚\bâ•­\bâ•®\bâ•¯\bâ•°\vborder\20layout_defaults\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\1\vmirror\1\22vimgrep_arguments\1\0\b\23selection_strategy\nreset\21sorting_strategy\14ascending\19color_devicons\2\20layout_strategy\15horizontal\18prompt_prefix\tï¡ˆ \17initial_mode\vinsert\20prompt_position\btop\17entry_prefix\a  \1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\14telescope\frequire'packadd telescope-media-files.nvim\31telescope-media-files.nvim#packadd telescope-project.nvim\27telescope-project.nvim$packadd telescope-frecency.nvim\28telescope-frecency.nvim\21packadd sql.nvim\rsql.nvim&packadd telescope-fzf-native.nvim\30telescope-fzf-native.nvim\23packadd popup.nvim\15popup.nvim\25packadd plenary.nvim\bcmd\bvim\vloaded\17plenary.nvim\19packer_plugins\tHOME\vgetenv\aos\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = { "\27LJ\2\2¶\4\0\0\4\0\22\0\0256\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0005\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\2=\2\21\1B\0\2\1K\0\1\0\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\vcancel\n<esc>\16toggle_mode\6m\nhover\6K\19toggle_preview\6P\rprevious\6k\frefresh\6r\nclose\6q\tnext\6j\fpreview\6p\1\0\f\15auto_close\2\vheight\3\n\17indent_lines\2\tmode\25document_diagnostics\ngroup\2\nicons\2\rposition\vbottom\17auto_preview\1\14auto_open\1\25use_diagnostic_signs\2\14auto_fold\2\nwidth\0032\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\2±\2\0\0\2\0\b\0\0256\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\1K\0\1\0%let g:go_highlight_operators = 1#let g:go_highlight_structs = 1#let g:go_highlight_methods = 1%let g:go_highlight_functions = 1\30let g:go_fmt_autosave = 1(:let g:go_fmt_command = \"goimports\"\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-pasta"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-pasta",
    url = "https://github.com/sickill/vim-pasta"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-tmux"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  vim_current_word = {
    config = { "\27LJ\2\2Ä\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\1K\0\1\0000 hi CurrentWordTwins gui=none guibg=#5f5f5f+ hi CurrentWord gui=none guibg=#5f5f5f2:let g:vim_current_word#highlight_delay = 250\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/vim_current_word",
    url = "https://github.com/dominikduda/vim_current_word"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    keys = { { "", "," } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/leukanos/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^mason"] = "mason.nvim",
  ["^null%-ls"] = "null-ls.nvim",
  ["telescope.*"] = "telescope.nvim",
  ["trouble.*"] = "trouble.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\2H\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'MarkdownPreview', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreview', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreview ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonUpdate', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonUpdate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonUpdate ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neotree', function(cmdargs)
          require('packer.load')({'neo-tree.nvim'}, { cmd = 'Neotree', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neo-tree.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neotree ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonUninstall', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonUninstall', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonUninstall ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonUninstallAll', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonUninstallAll', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonUninstallAll ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonUpdateAll', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonUpdateAll', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonUpdateAll ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TroubleToggle', function(cmdargs)
          require('packer.load')({'trouble.nvim'}, { cmd = 'TroubleToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'trouble.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TroubleToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonLog', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonLog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonLog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonInstall', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonInstall', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonInstall ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Mason', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'Mason', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Mason ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> , <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = ",", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'vim_current_word'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/leukanos/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/leukanos/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/leukanos/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
