-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Paste replace visual selection without copying it
vim.keymap.set("v", "p", '"_dP')

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")

-- Turn off highlighting
vim.keymap.set("n", "<leader>k", ":nohlsearch<CR>")

-- close all buffers
vim.keymap.set("n", "<leader>cc", ":bufdo bd<CR>", { desc = "Close all buffers" })

-- shortcut for normal mode in terminal
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
