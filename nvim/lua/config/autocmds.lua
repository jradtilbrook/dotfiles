-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php", "blade" },
  callback = function()
    vim.lsp.start({
      name = "laravel-ls",
      cmd = { vim.fn.expand("~/Developer/laravel-ls/start.sh") },
      root_dir = LazyVim.root.git(),
    })
  end,
})

-- Listen for opencode events
vim.api.nvim_create_autocmd("User", {
  pattern = "OpencodeEvent",
  callback = function(args)
    -- Do something interesting, like show a notification when opencode finishes responding
    if args.data.type == "session.idle" then vim.notify("opencode finished responding", vim.log.levels.INFO) end
  end,
})
