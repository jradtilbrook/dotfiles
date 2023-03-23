local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

--  TODO: install lua formatter
telescope.setup {
  mappings = {
    defaults = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-u>"] = false,
      },
    },
    preview = false,
    file_ignore_patterns = { 'node_modules' },

    winblend = 7,

    layout_config = {
      prompt_position = 'top',
      width = 0.75
    },
  },

  pickers = {
    builtin = {
      theme = 'dropdown',
    },

    find_files = {
      find_command = {'rg', '--files', '--no-ignore', '--hidden'},
      theme = 'dropdown',
    },

    git_files = {
      find_command = {'rg', '--files'},
      theme = 'dropdown',
    },

    current_buffer_fuzzy_find = {
      prompt_title = 'Current buffer',
      sorting_strategy = 'descending'
    },

    buffers = {
      sort_lastused = true,
      theme = 'dropdown',
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  },
}

--
-- Custom finders
--
builtin.edit_vim = function ()
  builtin.find_files(require('telescope.themes').get_dropdown{
    cwd = "$HOME/.config/nvim",
    prompt_title = "Neovim config",
    previewer = false,
  })
end

builtin.dotfiles = function ()
  builtin.find_files(require('telescope.themes').get_dropdown{
    cwd = "$HOME/projects/dotfiles",
    prompt_title = 'Dotfiles',
    previewer = false,
  })
end

-- TODO: i don't like the built in fzf, it finds things weirdly. check what config i can set or just use the real fzf
telescope.load_extension('fzf')
telescope.load_extension('sourcery')
telescope.load_extension('harpoon')
telescope.load_extension("git_worktree")
