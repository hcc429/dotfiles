return {
  "github/copilot.vim",
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer({ cwd = LazyVim.root(), hidden = true })
        end,
        desc = "Open Snacks explorer",
      },
    },
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
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     hints = { enabled = false },
  --     provider = "openai",
  --     openai = {
  --       endpoint = "https://api.openai.com/v1",
  --       model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
  --       timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --       temperature = 0,
  --       max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     },
  --     behaviour = {
  --       enable_cursor_planning_mode = false,
  --     },
  --     vendors = {
  --       --- ... existing vendors
  --       groq = { -- define groq provider
  --         __inherited_from = "openai",
  --         api_key_name = "GROQ_API_KEY",
  --         endpoint = "https://api.groq.com/openai/v1/",
  --         model = "llama-3.3-70b-versatile",
  --         max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
  --       },
  --     },
  --     file_selector = {
  --       provider = "fzf",
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   lazy = true,
  --   dependencies = { "saghen/blink.compat" },
  --   opts = {
  --     sources = {
  --       default = { "avante_commands", "avante_mentions", "avante_files" },
  --       compat = {
  --         "avante_commands",
  --         "avante_mentions",
  --         "avante_files",
  --       },
  --       -- LSP score_offset is typically 60
  --       providers = {
  --         avante_commands = {
  --           name = "avante_commands",
  --           module = "blink.compat.source",
  --           score_offset = 90,
  --           opts = {},
  --         },
  --         avante_files = {
  --           name = "avante_files",
  --           module = "blink.compat.source",
  --           score_offset = 100,
  --           opts = {},
  --         },
  --         avante_mentions = {
  --           name = "avante_mentions",
  --           module = "blink.compat.source",
  --           score_offset = 1000,
  --           opts = {},
  --         },
  --       },
  --     },
  --   },
  -- },
}
