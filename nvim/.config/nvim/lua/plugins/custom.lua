return {
  "github/copilot.vim",
  {
    "folke/snacks.nvim",

    keys = function()
      return {
        {
          "<leader>e",
          function()
            Snacks.explorer({ cwd = LazyVim.root(), hidden = true })
          end,
          desc = "Open Snacks explorer",
        },
        {
          "<leader>fb",
          function()
            Snacks.picker.buffers()
          end,
          desc = "Buffers",
        },
        { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
        { "<leader>fw", LazyVim.pick("grep"), desc = "Find Word" },
        {
          "<leader>fc",
          function()
            Snacks.picker.commands()
          end,
          desc = "Commands",
        },
        {
          "<leader>fj",
          function()
            Snacks.picker.jumps()
          end,
          desc = "Jumps",
        },
        {
          "<leader>fk",
          function()
            Snacks.picker.keymaps()
          end,
          desc = "Keymaps",
        },
        {
          "<leader>fl",
          function()
            Snacks.picker.loclist()
          end,
          desc = "Location List",
        },
        {
          "<leader>fr",
          function()
            Snacks.picker.registers()
          end,
          desc = "Registers",
        },
        {
          "<leader>fm",
          function()
            Snacks.picker.marks()
          end,
          desc = "Marks",
        },
        {
          "<leader>h",
          function()
            Snacks.picker.help()
          end,
          desc = "Help",
        },
        -- disable
        { "<leader>fE", false },
        { "<leader>fF", false },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()

      vim.list_extend(Keys, {
        {
          "<leader>fs",
          function()
            Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter })
          end,
          desc = "LSP symbols",
          has = "documentSymbol",
        },
        {
          "gd",
          function()
            Snacks.picker.lsp_definitions()
          end,
          desc = "Goto Definition",
          has = "definition",
        },
        {
          "gr",
          function()
            Snacks.picker.lsp_references()
          end,
          nowait = true,
          desc = "References",
        },
        {
          "gI",
          function()
            Snacks.picker.lsp_implementations()
          end,
          desc = "Goto Implementation",
        },
      })
    end,
  },
}
