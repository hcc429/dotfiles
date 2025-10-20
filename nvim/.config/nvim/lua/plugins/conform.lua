return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "golines" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
    },
  },
}
