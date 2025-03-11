-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode" })
map("i", "jj", "<ESC>")

map("n", "<leader>d", [["_d]], { desc = "delete without yanking" })

map("n", "<CR>", "o<ESC>", { desc = "add blank line below" })

map("n", "<BS>", [["_dd]], { desc = "remove a line", noremap = true, silent = true })
map("x", "<C-H>", [["_d]], { desc = "remove selected text", noremap = true, silent = true })

-- delete a word with backspace in insert mode
map("i", "<C-H>", "<C-W>", { desc = "delete word backward", noremap = true, silent = true })

map("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center" })
map("n", "n", "nzzzv", { desc = "search next and center" })
map("n", "N", "Nzzzv", { desc = "search prev and center" })

map("n", "<Tab>", ":bnext<CR>", { desc = "next tab" })
map("n", "<S-Tab>", ":bprev<CR>", { desc = "previous tab" })

map("n", "L", "$")
map("n", "H", "^")

-- toggle copilot
local copilot_enabled = true
map("n", "<leader>ct", function()
  if copilot_enabled then
    vim.cmd("Copilot disable")
    copilot_enabled = false
  else
    vim.cmd("Copilot enable")
    copilot_enabled = true
  end
end, { desc = "toggle copilot" })
