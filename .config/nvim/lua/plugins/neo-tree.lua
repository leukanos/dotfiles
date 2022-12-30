vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  sort_case_insensitive = false,
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_marker = '|',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = nil,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highliight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      older_empty = "ﰊ",
      default = "*",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName"
    },
  },
  window = {
    mappings = {
      ["ss"] = "open_split",
      ["sv"] = "open_vsplit"
    }
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false
    },
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
  buffer = {
    follow_current_file = true,
  },
  source_selector = {
    winbar = true
  }
})

