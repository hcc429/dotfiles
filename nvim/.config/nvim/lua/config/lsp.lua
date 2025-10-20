require("lspconfig").vtsls.setup({
  -- disable formatting in favor of conform.nvim
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})
