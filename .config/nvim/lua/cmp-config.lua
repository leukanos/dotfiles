-- ---------------
-- Set up nvim-cmp
-- ---------------

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  formatting = {
      format = function(entry, vim_item)
          -- fancy icons and a name of kind
          -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] ..
             --                 " " .. vim_item.kind
          -- set a name for each source
          vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              ultisnips = "[UltiSnips]",
              nvim_lua = "[Lua]",
              look = "[Look]",
              path = "[Path]",
              spell = "[Spell]",
              calc = "[Calc]",
              emoji = "[Emoji]"
          })[entry.source.name]
          return vim_item
      end
  },

	mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Enter>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
		{ name = 'buffer' }, { name = 'look' }, { name = 'calc' }, { name = 'emoji' }, { name = 'spell' },
		{ name = 'path' }, { name = 'ultisnips' }, { name = 'nvim_lsp' }, { name = 'nvim_lua' },
  }),
	completion = { completeopt = 'menu,menuone,noinsert' } 
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
--local servers = { 'bashls', 'clangd', 'cmake', 'dockerls', 'gopls', 'html', 'jsonls', 'sumneko_lua', 'texlab', 'tsserver', 'vimls', 'yamlls' }
local servers = { 'gopls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end 

require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}   
