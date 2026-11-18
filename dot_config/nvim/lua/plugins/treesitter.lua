return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  -- The `master` branch is archived and incompatible with Neovim 0.12+.
  -- `main` requires the `tree-sitter` CLI to compile parsers.
  branch = 'main',
  lazy = false, -- `main` does not support lazy-loading
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'

    ts.install {
      'c',
      'cpp',
      'lua',
      'python',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      'regex',
      'terraform',
      'sql',
      'dockerfile',
      'toml',
      'json',
      'java',
      'groovy',
      'go',
      'gitignore',
      'graphql',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'tsx',
      'css',
      'html',
    }

    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  regex_highlight and indent_disable.
    local regex_highlight = { ruby = true }
    local indent_disable = { ruby = true }

    local available = {}
    for _, lang in ipairs(ts.get_available()) do
      available[lang] = true
    end

    local function attach(buf, lang)
      if not vim.api.nvim_buf_is_valid(buf) or not pcall(vim.treesitter.start, buf, lang) then
        return
      end
      if regex_highlight[lang] then
        vim.bo[buf].syntax = 'on'
      end
      if not indent_disable[lang] then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
          return
        end
        if vim.treesitter.language.add(lang) then
          attach(args.buf, lang)
        elseif available[lang] then
          -- Autoinstall languages that are not installed
          ts.install(lang):await(function()
            vim.schedule(function()
              attach(args.buf, lang)
            end)
          end)
        end
      end,
    })
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects (use the `main` branch)
}
