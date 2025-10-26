local conform_opt = {
  lsp_fallback = true,
  async = false,
  timeout_ms = 500,
}

return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        go = { 'golines' },
        typescript = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        lua = {'stylua'},
        sh = {"shfmt"}
      },
      format_on_save = conform_opt,
    }
    vim.keymap.set('n', '<leader>ff', function()
      conform.format(conform_opt)
    end, { noremap = true, desc = 'Format file.' })


  end,
}
