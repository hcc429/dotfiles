return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        header = [[
        ⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡤⠤⠤⠤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⠉⠛⢦⣤⠶⠦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⠞⢋⡽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⠀⠙⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣰⠟⠁⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⠀⠉⠓⠦⣤⣤⣤⣤⣤⣤⣄⣀⠀⠀⠀
⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣷⡄⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣆⠀
⠀⠀⣠⠞⠁⠀⠀⣀⣠⣏⡀⠀⢠⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠿⡃⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡆
⢀⡞⠁⠀⣠⠶⠛⠉⠉⠉⠙⢦⡸⣿⡿⠀⠀⠀⡄⢀⣀⣀⡶⠀⠀⠀⢀⡄⣀⠀⣢⠟⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃
⡞⠀⠀⠸⠁⠀⠀⠀⠀⠀⠀⠀⢳⢀⣠⠀⠀⠀⠉⠉⠀⠀⣀⠀⠀⠀⢀⣠⡴⠞⠁⠀⠀⠈⠓⠦⣄⣀⠀⠀⠀⠀⣀⣤⠞⠁⠀
⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠁⠀⢀⣀⣀⡴⠋⢻⡉⠙⠾⡟⢿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠉⠉⠀⠀⠀⠀
⠘⣦⡀⠀⠀⠀⠀⠀⠀⣀⣤⠞⢉⣹⣯⣍⣿⠉⠟⠀⠀⣸⠳⣄⡀⠀⠀⠙⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⠙⠒⠒⠒⠒⠚⠋⠁⠀⡴⠋⢀⡀⢠⡇⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⢀⡾⠋⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢸⡀⠸⡇⠀⠀⠀⠉⠉⠀⠁⠁⠁⠈⢉⠒⠲⣤⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠉⠋⠻⣄⠀⠀⠀⠀⠀⣀⣠⣴⠞⠋⠳⠶⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠦⢤⠤⠶⠋⠙⠳⣆⣀⣈⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  
]],
      },
    },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = {
      enabled = false,
    },
    picker = {
      enabled = true,
      hidden = true,
      ignore = { "node_modules", ".git" },
      sources = {
        explorer = {
          actions = {
            copy_name = function(_, item)
              if not item then return end
              local name = vim.fn.fnamemodify(item.file, ":t")
              vim.fn.setreg("+", name)
              vim.notify("Copied name: " .. name)
            end,
            copy_abs_path = function(_, item)
              if not item then return end
              vim.fn.setreg("+", item.file)
              vim.notify("Copied path: " .. item.file)
            end,
            copy_rel_path = function(_, item)
              if not item then return end
              local rel = vim.fn.fnamemodify(item.file, ":.")
              vim.fn.setreg("+", rel)
              vim.notify("Copied relative path: " .. rel)
            end,
            lazygit_log_file = function(_, item)
              if not item then return end
              Snacks.lazygit({
                args = { "-f", item.file },
                cwd = vim.fn.fnamemodify(item.file, ":h"),
              })
            end,
            lazygit_log_folder = function(_, item)
              if not item then return end
              local dir = item.file
              if vim.fn.isdirectory(dir) == 0 then
                dir = vim.fn.fnamemodify(dir, ":h")
              end
              Snacks.lazygit({ args = { "-f", dir } })
            end,
          },
          win = {
            list = {
              keys = {
                -- navigation (keep)
                ["<CR>"] = "confirm",
                ["l"] = "confirm",
                ["h"] = "explorer_close",
                ["<BS>"] = "explorer_up",
                ["q"] = "close",
                ["<Esc>"] = "close",

                -- the only file ops I want
                ["a"] = "explorer_add",       -- create
                ["d"] = "explorer_del",       -- delete
                ["r"] = "explorer_rename",    -- rename
                ["c"] = "explorer_copy",      -- copy file (duplicate in tree)
                ["p"] = "explorer_paste",     -- paste after copy/cut
                ["yn"] = "copy_name",         -- yank filename
                ["yp"] = "copy_abs_path",     -- yank absolute path
                ["yr"] = "copy_rel_path",     -- yank relative path
                ["gf"] = { "lazygit_log_file", desc = "Lazygit file history" },
                ["g/"] = { "lazygit_log_folder", desc = "Lazygit folder history" },

                -- disable the rest of the defaults so they don't clutter
                ["m"] = false,                -- move
                ["o"] = false,                -- system open
                ["y"] = false,                -- (replaced by yn/yp/yr)
                ["Y"] = false,
                ["u"] = false,                -- refresh (use :e)
                ["<c-c>"] = false,            -- tcd
                ["."] = false,                -- focus
                ["I"] = false,                -- toggle ignored
                ["H"] = false,                -- toggle hidden (leader e again)
                ["Z"] = false,                -- close all
                ["z"] = false,
                ["/"] = false,
                ["]c"] = false, ["[c"] = false,
                ["]d"] = false, ["[d"] = false,
                ["]w"] = false, ["[w"] = false,
                ["]e"] = false, ["[e"] = false,
                ["s"] = false,                -- scratch
              },
            },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit log for current file",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit full log",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "Snacks Explorer",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "[S]earch [K]eymaps",
    },
    {
      "<leader>sf",
      function()
        Snacks.picker.files()
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.registers()
      end,
      desc = "[S]earch [R]egisters",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep { search = vim.fn.expand "<cword>" }
      end,
      desc = "[S]earch current [W]ord",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "[S]earch by [G]rep",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "[S]earch [M]arks",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "[S]earch [J]umplist",
    },
    {
      "<leader>s.",
      function()
        Snacks.picker.recent()
      end,
      desc = "[S]earch Recent Files",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "[ ] Find existing buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.lines()
      end,
      desc = "[/] Fuzzily search in current buffer",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "[S]earch [/] in Open Files",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has "nvim-0.11" == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end
      end,
    })

    vim.g.snacks_animate = false
  end,
}
