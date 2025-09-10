-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- i hit the hold-tap key while trying to type, resulting in moving lines, so disable it in insert mode
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php", -- replace with your filetype
  callback = function()
    vim.keymap.set({ "n", "v" }, "<leader>cpm", function()
      vim.ui.input({
        prompt = "Where to move?",
        completion = "file",
      }, function(input)
        if input == nil or input == "" then return end
        local current = LazyVim.root.bufpath(0)
        vim.notify("Moving class to " .. input, vim.log.levels.INFO, { title = "Phpactor" })
        vim.fn.system({ "phpactor", "move:class", current, input })
      end)
    end, { desc = "Phpactor move:class" })

    vim.keymap.set({ "n", "v" }, "<leader>cpn", function()
      local current = LazyVim.root.bufpath(0)
      vim.notify("Fixing namespace", vim.log.levels.INFO, { title = "Phpactor" })
      -- TODO: would be good to call async if not already and show someting in fidget while its running? seems like noice
      -- TODO: seems to work but doesnt reload the buffer
      vim.fn.system({ "phpactor", "class:transform", "--transform=fix_namespace_class_name", current })
    end, { desc = "Phpactor fix namespace" })
  end,
})
