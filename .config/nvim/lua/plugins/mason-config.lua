local config = {}

function config.mason_null_ls()
  local masonNullLs = require "mason-null-ls"
  masonNullLs.setup({
    automatic_setup = true,
  })
  masonNullLs.setup_handlers()
end

function config.mason_lspconfig()
  local navic = require("nvim-navic")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

  require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'dockerls',
      'gopls',
      'graphql',
      'grammarly',
      'jsonls',
      'sumneko_lua',
      'terraformls',
      'vimls',
      'yamlls',
      'html',
      'intelephense',
      'tsserver',
      'cssls',
      'eslint',
    },
  })

  require('mason-lspconfig').setup_handlers {
    function(server_name)
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
    ['sumneko_lua'] = function()
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
  }
end


return config
