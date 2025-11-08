return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
      provider = 'openai',
      auto_suggestions_provider = nil,

      -- OpenAI Config
      providers = {
        openai = {
          endpoint = 'https://api.openai.com/v1',
          model = 'gpt-5-mini',
          extra_request_body = {
            timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
            temperature = 0,
            max_request_tokens = 8192,
          },
        },
      },
    },
    build = 'make',
    dependencies = {
      'zbirenbaum/copilot.lua', -- Required for copilot provider
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-tree/nvim-web-devicons',
      -- Optional:
      'echasnovski/mini.pick',
      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
    },
  },
}
