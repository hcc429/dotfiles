-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode" })
map("i", "jj", "<ESC>")

map("n", "<leader>d", [["_d]], { desc = "delete without yanking" })

map("n", "<CR>", "o<ESC>", { desc = "add blank line below" })
map("n", "<BS>", "_dd", { desc = "remove a line", noremap = true, silent = true })

map("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center" })
map("n", "n", "nzzzv", { desc = "search next and center" })
map("n", "N", "Nzzzv", { desc = "search prev and center" })

map("n", "<Tab>", ":bnext<CR>", { desc = "next tab" })
map("n", "<S-Tab>", ":bprev<CR>", { desc = "previous tab" })
