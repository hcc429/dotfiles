-- -- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    -- Show blame for the cursor line as virtual text after the cursor rests (default 1000ms).
    -- Don't add `keys` here: lazy.nvim would turn it into load-on-keypress and gitsigns
    -- would never start (that's what broke it on 2026-08-07).
    current_line_blame = true,
  },
}
