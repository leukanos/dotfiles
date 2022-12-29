-- ---------------
-- Set up nvim-cmp
-- ---------------

local cmp = require'cmp'
local lspkind = require('lspkind')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  formatting = {
      
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      menu = ({
        buffer = "[Buffer]",
        calc = "[Calc]",
        nvim_lsp = "[LSP]",
      })
    })
  },

	mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping({
      c = function()
          if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
              cmp.complete()
          end
      end,
      i = function(fallback)
          if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
          else
              fallback()
          end
      end,
      s = function(fallback)
          if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
          else
              fallback()
          end
      end
    }),
    ["<S-Tab>"] = cmp.mapping({
      c = function()
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
              cmp.complete()
          end
      end,
      i = function(fallback)
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
          else
              fallback()
          end
      end,
      s = function(fallback)
          if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
          else
              fallback()
          end
      end
    }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Enter>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-n>'] = cmp.mapping({
        c = function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
            end
        end,
        i = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end
    }),
    ['<C-p>'] = cmp.mapping({
        c = function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
            end
        end,
        i = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end
    }),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end
    }),
  }),
  sources = cmp.config.sources({
		{ name = 'buffer' }, { name = 'look' }, { name = 'calc' }, { name = 'emoji' }, { name = 'spell' },
		{ name = 'path' }, { name = 'ultisnips' }, { name = 'nvim_lsp' }, { name = 'nvim_lua' }, { name = 'treesitter' },
    { name = 'ctags' }
  }),
	completion = { completeopt = 'menu,menuone,noinsert' } 
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  completion = { autocomplete = false },
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  completion = { autocomplete = false },
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

