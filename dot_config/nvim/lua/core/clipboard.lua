if vim.env.SSH_TTY ~= nil and vim.env.TMUX == nil and vim.env.TERM ~= 'tmux-256color' then
  vim.g.clipboard = 'osc52'
end
