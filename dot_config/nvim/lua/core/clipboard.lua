-- Over SSH there is no local clipboard tool, so copy via OSC 52 (the terminal
-- writes to the host clipboard; tmux forwards it with `set-clipboard on`).
--
-- Paste is NOT done via OSC 52: reading the clipboard requires a terminal
-- response that most terminals/tmux don't send, so Neovim would block waiting
-- for it. Instead paste falls back to Neovim's own unnamed register, which
-- holds whatever was last yanked/copied inside this Neovim instance.
if vim.env.SSH_TTY ~= nil then
  local osc52 = require 'vim.ui.clipboard.osc52'

  local function paste()
    return { vim.fn.split(vim.fn.getreg '"', '\n'), vim.fn.getregtype '"' }
  end

  vim.g.clipboard = {
    name = 'osc52-copy-only',
    copy = { ['+'] = osc52.copy '+', ['*'] = osc52.copy '*' },
    paste = { ['+'] = paste, ['*'] = paste },
  }
end
