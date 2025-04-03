return {
  "snacks.nvim",
  opts = {
    dashboard = {
      width = 77,
      pane_gap = 15,
      preset = {
        header = [[
██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
   ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", indent = 2, padding = 1 },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          return {
            {
              pane = 2,
              section = "terminal",
              ttl = 5 * 60,
              indent = 3,
              icon = " ",
              title = "My PRs",
              cmd = [[GH_PAGER="" gh my-prs-table]], -- custom gh alias
              key = "pm",
              action = function()
                vim.fn.jobstart("gh my-prs --web", { detach = true })
              end,
              enabled = in_git,
              height = 3,
              padding = 1,
            },
            {
              pane = 2,
              section = "terminal",
              ttl = 5 * 60,
              indent = 3,
              icon = " ",
              title = "PR Reviews",
              cmd = [[GH_PAGER="" gh review-prs-table]], -- custom gh alias
              key = "pr",
              action = function()
                vim.fn.jobstart("gh review-prs --web", { detach = true })
              end,
              enabled = in_git,
              height = 3,
              padding = 1,
            },
          }
        end,
        { section = "startup" },
      },
    },
  },
}
