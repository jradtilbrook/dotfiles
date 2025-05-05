return {
  {
    -- override gitsigns to show line blame by default and add a toggle keymap
    "lewis6991/gitsigns.nvim",
    optional = true,
    opts = function(_, opts)
      local on_attach = opts.on_attach
      return vim.tbl_deep_extend("force", opts, {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 200,
        },
        on_attach = function(buffer)
          on_attach(buffer)
          Snacks.toggle({
            get = function() return require("gitsigns.config").config.current_line_blame end,
            name = "Git Blame Line",
            set = function(state) require("gitsigns").toggle_current_line_blame(state) end,
          }):map("<leader>uB")
        end,
      })
    end,
  },
}
