local config = {}

function config.masonLspConfig()
  local masonLspConfig = require "mason-lspconfig"
  masonLspConfig.setup({
    automatic_setup = true,
  })
  masonLspConfig.setup_handlers()
end

function config.mason_null_ls()
  local masonNullLs = require "mason-null-ls"
  masonNullLs.setup({
    automatic_setup = true,
  })
  masonNullLs.setup_handlers()
end

return config
