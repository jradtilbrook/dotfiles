return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    ---@type opencode.Config
    opts = {
      prompts = {
        commit_msg = {
          description = "Generate a git commit message",
          prompt = table.concat(
            {
              "Generate a concise git commit message written in present tense for the following code diff with the given specifications below:",
              "Follow git commit message best practices for line length and formatting.",
              "Exclude anything unnecessary such as translation. Your entire response will be passed directly into git commit.",
              "@staged",
            },
            "\n"
          ),
        },
      },
      contexts = {
        ["@staged"] = {
          value = function()
            local handle = io.popen("git --no-pager diff --cached")
            if not handle then return nil end
            local result = handle:read("*a")
            handle:close()
            if result and result ~= "" then return result end
            return nil
          end,
          description = "Git diff",
        },
      },
    },
    keys = {
      { "<leader>ot", function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
      { "<leader>oa", function() require("opencode").ask() end, desc = "Ask opencode", mode = "n" },
      {
        "<leader>oa",
        function() require("opencode").ask("@selection: ") end,
        desc = "Ask opencode about selection",
        mode = "v",
      },
      {
        "<leader>op",
        function() require("opencode").select_prompt() end,
        desc = "Select prompt",
        mode = { "n", "v" },
      },
      { "<leader>on", function() require("opencode").command("session_new") end, desc = "New session" },
      { "<leader>oy", function() require("opencode").command("messages_copy") end, desc = "Copy last message" },
      {
        "<S-C-u>",
        function() require("opencode").command("messages_half_page_up") end,
        desc = "Scroll messages up",
      },
      {
        "<S-C-d>",
        function() require("opencode").command("messages_half_page_down") end,
        desc = "Scroll messages down",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        {
          { "<leader>o", group = "+opencode", icon = { icon = "󰅩 ", color = "purple" } },
        },
      },
    },
  },
}
