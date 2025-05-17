-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- i hit the hold-tap key while trying to type, resulting in moving lines, so disable it in insert mode
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
