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
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
        timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0,
        max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
      behaviour = {
        enable_cursor_planning_mode = true,
      },
      vendors = {
        --- ... existing vendors
        groq = { -- define groq provider
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "llama-3.3-70b-versatile",
          max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
