return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    auto_insert_mode = false,
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    opts = {
      copilot_node_command = vim.fn.expand("$NVM_DIR") .. "/versions/node/v22.18.0/bin/node",
    },
  },
}
