local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
 local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, bufopts)

end

vim.opt.completeopt={"menu","menuone","noselect"}
local cmp = require'cmp'

cmp.setup({
	snippet = {
	  expand = function(args)
		require('luasnip').lsp_expand(args.body)
	  end,
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' },
	}, {
	  { name = 'buffer' },
	})
})


require'lspconfig'.gopls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}
require'lspconfig'.bashls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}
require'lspconfig'.perlpls.setup {
  settings = { 
    perl = { 
      perlcritic = { enabled = true },
      syntax = { enabled = true },
    } 
  },
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}
