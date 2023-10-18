return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                            },
                        },
                    },
                    git_files = {
                        mappings = {
                            i = {
                                -- mapping to switch git-ignore on/off
                                ["<c-a>"] = function(prompt_bufnr)
                                    local action_state = require("telescope.actions.state")
                                    local current_picker = action_state.get_current_picker(prompt_bufnr)
                                    local pickers = require("telescope.pickers")
                                    local finders = require("telescope.finders")
                                    local conf = require("telescope.config").values
                                    local picker = pickers
                                        .new({}, {
                                            prompt_title = "Git Files (No .gitignore)",
                                            finder = finders.new_oneshot_job({
                                                "rg",
                                                "--files",
                                                "--no-ignore",
                                                "--follow",
                                                "--hidden",
                                                "--glob",
                                                "!**/.git/*",
                                            }),
                                            previewer = conf.file_previewer({}),
                                            sorter = conf.file_sorter({}),
                                        })
                                        :find()
                                    current_picker:refresh(picker)
                                end,
                            },
                        },
                    },
                },
                defaults = {
                    layout_config = {
                        prompt_position = "top",
                    },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                },
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
            local builtin = require("telescope.builtin")

            -- a function to fall back to find_files if not in a git repo
            -- cache the results of git rev-parse
            local is_inside_work_tree = {}
            project_files = function()
                local cwd = vim.fn.getcwd()
                if is_inside_work_tree[cwd] == nil then
                    vim.fn.system("git rev-parse --is-inside-work-tree")
                    is_inside_work_tree[cwd] = vim.v.shell_error == 0
                end

                if is_inside_work_tree[cwd] then
                    builtin.git_files({})
                else
                    builtin.find_files({})
                end
            end

            vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
            vim.keymap.set(
                "n",
                "<leader>-",
                require("telescope").extensions.file_browser.file_browser,
                { desc = "[-] File browser" }
            )
            vim.keymap.set(
                "n",
                "<leader>/",
                require("telescope.builtin").current_buffer_fuzzy_find,
                { desc = "[/] Fuzzily search in current buffer" }
            )
            vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "[S]earch [T]elescope" })
            vim.keymap.set("n", "<leader>sf", project_files, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        end,
    },

    { "nvim-telescope/telescope-file-browser.nvim" },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
}
