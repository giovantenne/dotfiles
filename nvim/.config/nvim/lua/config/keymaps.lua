-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "kj", "<ESC>", { silent = true })
vim.keymap.set({ "i", "n" }, "kjs", "<cmd>w<cr><esc>", { silent = false })

vim.api.nvim_set_keymap("n", "H", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "H", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "L", "g_", { noremap = true, silent = true })

local map = LazyVim.safe_keymap_set
map("n", "<C-S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<C-S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map({ "i", "x", "n", "s" }, "<C-S-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

vim.keymap.set("n", "gn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "gb", ":bprevious<CR>", { desc = "Prev buffer" })
