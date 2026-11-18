return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'

    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
    }

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline {
        ['<Down>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'c' }),
        ['<Up>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'c' }),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm { select = false }
          else
            fallback()
          end
        end, { 'c' }),
      },
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })
    cmp.setup {
      preselect = cmp.PreselectMode.None,
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
      },
      mapping = cmp.mapping.preset.insert {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm { select = false } -- select=false: 不自動選第一個
          else
            fallback() -- 真的 Enter
          end
        end, { 'i', 's' }),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      },
    }
  end,
}
