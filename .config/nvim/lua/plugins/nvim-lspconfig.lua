return function()

  if not packer_plugins["nvim-lspconfig"].loaded then
    vim.cmd [[packadd nvim-lspconfig]]
  end

  if not packer_plugins["nvim-navic"].loaded then
    vim.cmd [[packadd nvim-navic]]
  end

  if not packer_plugins["lspsaga.nvim"].loaded then
      vim.cmd [[packadd lspsaga.nvim]]
  end

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local navic = require("nvim-navic")
  local lspconfig = require('lspconfig')
  --local servers = { 'bashls', 'clangd', 'cmake', 'dockerls', 'gopls', 'html', 'jsonls', 'sumneko_lua', 'texlab', 'tsserver', 'vimls', 'yamlls' }
  local servers = { 'gopls', 'luau_lsp', 'tsserver', 'vimls', 'html' , 'cssls', 'jsonls', 'eslint', 'bashls',
    'cmake', 'yamlls', 'grammarly', 'dockerls', 'tsserver', 'sumneko_lua',
  }

  local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
      end

      require "lsp_signature".on_attach({
          bind = true,
          handler_opts = {
              border = "rounded"
          }
      }, bufnr)
  end

  for _, lsp in ipairs(servers) do

    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  require'lspconfig'.sumneko_lua.setup {
      settings = {
          Lua = {
              diagnostics = {
                  globals = { 'vim', 'packer_plugins' }
              }
          }
      },
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
