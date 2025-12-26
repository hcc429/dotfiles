return {
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup {
        flavour = 'frappe', -- latte, frappe, macchiato, mocha
        transparent_background = true,
      }
    end,
  },
}
